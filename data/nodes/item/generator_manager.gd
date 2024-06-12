extends Node
class_name GeneratorManager
## This node is responsible for creating instances of itself using the data passed to it

@export var data: Node

func create():
  return data.new()