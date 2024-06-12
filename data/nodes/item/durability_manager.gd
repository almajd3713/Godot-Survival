extends Node
class_name DurabilityManager

@export var durability := 10
@export var max_durability := 10

@export var countManager: CountManager


func consume(amount: int) -> bool:
  if durability < amount:
    Signals.UpdateUI.emit()
    return false
  elif amount in range(durability):
    durability -= amount
    Signals.UpdateUI.emit()
    return true
  elif countManager and amount in range(durability, all_item_durability()):
    var yeet_count = floori(amount / max_durability)
    countManager.consume(floori(amount / max_durability))
    amount -= yeet_count * max_durability
    return consume(amount)
  elif durability == amount:
    queue_free()
    Signals.UpdateUI.emit()
    return true
  return false
      

func all_item_durability():
  return max_durability * (countManager.count - 1) + durability