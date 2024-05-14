extends Node

func _ready():
  Data.save_game()
  Data.load_game()