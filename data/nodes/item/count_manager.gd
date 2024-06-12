extends Node
class_name CountManager


@export var count := 0
@export var stack_size := 10

func produce(amount: int) -> bool:
  count += amount
  return true


func consume(amount: int) -> bool:
  if count < amount:
    return false
  else:
    count -= amount
    return true