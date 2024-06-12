extends Node

var tabs: Array[TabDefault] = []
var actions: Array[Array] = []
var player: Agent
var items: Array[Node] = []
var agents: Array[Agent] = []



func save_game():
  var data = self
  if not DirAccess.dir_exists_absolute("user://saves"):
    DirAccess.make_dir_absolute("user://saves")
  var file = FileAccess.open("user://saves/save_1.dat", FileAccess.WRITE)
  file.store_var(data, true)

func load_game(path: String = "user://saves/save_1.dat"):
  # if FileAccess.file_exists(path):
  #   load_game_saved("user://saves/save_1.dat")
  # else:
    load_new_game()

func load_game_saved(path: String = "user://saves/save_1.dat"):
  var file = FileAccess.open(path, FileAccess.READ)
  var save = file.get_var(true)
  load_from_save(save)
  
func load_new_game():
  player = Agent.new()
  pass;

func load_from_save(save: Data):
  tabs = save.tabs
  actions = save.actions
  player = save.player
  agents = save.agents


## Deep copies a dictionary 
func deep_copy_dict(dict: Dictionary) -> Dictionary:
  var result: Dictionary = {}
  for key in dict:
    if (
      not (dict[key] is int or dict[key] is Array)
    ) and  dict[key].has_method("duplicate"):
      result[key] = dict[key].duplicate()
    else:
      result[key] = dict[key]
  return result
