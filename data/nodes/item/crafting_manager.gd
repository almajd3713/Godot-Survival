extends Node
class_name CraftingManager


## [Item, Amount]
@export var ingredient_list: Array[Array]

func ableToCraft(agent: Agent, item):
  return ingredient_list.all(func(ingredient): return agent.access(item[0], item[1]))
    