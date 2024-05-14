extends Node

@export var stats := {
  "health": 50
}

func save_game():
  var data = self
  if not DirAccess.dir_exists_absolute("user://saves"):
    DirAccess.make_dir_absolute("user://saves")
  var file = FileAccess.open("user://saves/save_1.dat", FileAccess.WRITE)
  file.store_var(data, true)

func load_game(path: String = "user://saves/save_1.dat"):
  if FileAccess.file_exists(path):
    load_game_saved("user://saves/save_1.dat")

func load_game_saved(path: String = "user://saves/save_1.dat"):
  var file = FileAccess.open(path, FileAccess.READ)
  var save = file.get_var(true)
  load_from_save(save)
  


func load_from_save(save):
  stats = deep_copy_dict(save.stats)


## Deep copies a dictionary 
func deep_copy_dict(dict: Dictionary) -> Dictionary:
  var result: Dictionary = {}
  for key in dict:
    if (not dict[key] is int) and  dict[key].has_method("duplicate"):
      result[key] = dict[key].duplicate()
    else:
      result[key] = dict[key]
  return result
