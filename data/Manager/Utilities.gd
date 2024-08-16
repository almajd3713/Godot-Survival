extends Node


func Count(item: Node, callback: Callable, failureCallback = 0):
  var manager = item.get_node("CountManager")
  if manager:
    callback.call(manager)
    return true
  if failureCallback: failureCallback.call()
  return false

func CountDual(item1: Node, item2: Node, callback: Callable, failureCallback = 0):
  var manager1 = item1.get_node("CountManager")
  var manager2 = item2.get_node("CountManager")
  if manager1 and manager2:
    callback.call(manager1, manager2)
    return true
  if failureCallback:
    failureCallback.call()
    return false

func Durability(item: Node, callback: Callable, failureCallback = 0):
  var manager = item.get_node("DurabilityManager")
  if manager:
    callback.call(manager)
    return true
  if failureCallback: failureCallback.call()
  return false

func Item(item: Node, callback: Callable, failureCallback = 0):
  var manager = item.get_node("ItemManager")
  if manager:
    callback.call(manager)
    return true
  if failureCallback: failureCallback.call()
  return false


var DummyData