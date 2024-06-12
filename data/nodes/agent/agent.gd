extends Node
class_name Agent


@export var inventory: Inventory

@export var stats := {
  ## [amount, maxAmount]
  "health": [100, 100],
  "hunger": [100, 100],
  "stamina": [100, 100],
  "mp": [100, 100]
}

func _init():
  inventory = Inventory.new()

func give(item: Node):
  if item.get_node("CountManager"):
    inventory.push(item)