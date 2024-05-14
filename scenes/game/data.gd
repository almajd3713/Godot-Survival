extends Node

const DEFAULT_DATA = "res://scripts/data"
const SAVE_PATH = "user://saves"
const SAVE_FILE = "save.tres"


@export var saved_game: SavedGame = SavedGame.new()

const LOAD_DATA = false

## {resource.name: resource}
@export var resources: Dictionary
## {resource.name: [increment, multplier]}
@export var resourceMultiplier: Dictionary
@export var upgrades: Dictionary

func _init():
  if LOAD_DATA: load_saved()
  else: load_new()
  Signals.UpdateUI.emit()

func load_new():
  for file_name in DirAccess.get_files_at(DEFAULT_DATA):
    if file_name.ends_with(".tres"):
      var res = load(DEFAULT_DATA + "/" + file_name)

      if res is GameResource: resources[file_name.trim_suffix(".tres")] = res
      elif res is Upgrade: upgrades[file_name.trim_suffix(".tres")] = res
  Game.isDataReady = true
  for res in resources:
    ## [Incremental, Multiplier, Passive]
    resources[res].load_data(resources)
    resourceMultiplier[res] = [1, 1, 0]


func load(type, varName):
  if Game.isDataReady: match type:
    "resource": return resources[varName]
    "upgrade": return upgrades[varName]


func save():
  saved_game.resources = deep_copy_dict(resources)
  saved_game.upgrades = deep_copy_dict(upgrades)
  saved_game.resourceMultiplier = resourceMultiplier
  ## Makes sure the directory exists
  saved_game = saved_game.duplicate(true)
  DirAccess.make_dir_absolute(SAVE_PATH)
  ResourceSaver.save(saved_game, SAVE_PATH + "/" + SAVE_FILE)
  print("Game saved")


func load_saved() -> bool:
  if ResourceLoader.exists(SAVE_PATH + "/" + SAVE_FILE):
	# var data = ResourceLoader.load(SAVE_PATH + "/" + SAVE_FILE, "", ResourceLoader.CACHE_MODE_IGNORE).duplicate(true)
    var data = load(SAVE_PATH + "/" + SAVE_FILE)
    resources = data.resources
    upgrades = data.upgrades
    resourceMultiplier = data.resourceMultiplier
    return true
  return false

## Deep copies a dictionary of saves
func deep_copy_dict(dict: Dictionary) -> Dictionary:
  var result: Dictionary = {}
  for key in dict:
    result[key] = dict[key].duplicate()
  return result
