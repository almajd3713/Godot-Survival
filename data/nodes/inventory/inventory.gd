extends Node
class_name Inventory

@export var size := 30

var itemList: Dictionary

func push(desired):
  if itemList.has(desired.get_node("ItemManager").code_name):
    if desired.get_node("CountManager"):
      itemList[desired.get_node("ItemManager").code_name].get_node("CountManager").count += desired.get_node("CountManager").count
    else: itemList[desired.get_node("ItemManager").code_name].get_node("CountManager").count += 1
  else: itemList[desired.get_node("ItemManager").code_name] = desired
  # if itemList.has(desired.name):
  #   if desired.get_node("CountManager"):
  #     itemList[desired.name][0] += desired.get_node("CountManager").count
  #   else:
  #     itemList[desired.name].append(desired)
  
  # else:
  #   itemList[desired.name] = [desired]
  Signals.UpdateUI.emit()
