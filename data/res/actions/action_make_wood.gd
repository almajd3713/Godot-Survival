extends Action
class_name ActionMakeWood

@export var wood_scene: PackedScene

func claim():
  var wood = wood_scene.instantiate()
  wood.get_node("CountManager").produce(1)
  Data.player.give(wood)
