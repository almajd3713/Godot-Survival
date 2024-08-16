extends Node
class_name Inventory

@export var size := 30

var itemList: Dictionary

func push(desired):
  # if itemList.has(desired.get_node("ItemManager").code_name):
  #   itemList[desired.get_node("ItemManager").code_name].get_node("CountManager").count += \
  #   desired.get_node("CountManager").count if desired.get_node("CountManager") \
  #   else 1
  # else: itemList[desired.get_node("ItemManager").code_name] = desired

  # Util.Item(desired, func(itemMan):
  #   if not Util.Count(desired, func(countMan):
  #     Util.Count(itemList[itemMan.code_name], func(countInnerMan): countInnerMan.count += countMan.count)
  #   ): Util.

  # )
  print(desired)
  Util.Item(desired, func(itemMan):
    if itemList.has(itemMan.code_name):
      Util.Count(itemList[itemMan.code_name], func(countInnerMan):
        Util.Count(desired, 
          func(countMan): countInnerMan.count += countMan.count,
          func(): countInnerMan += 1
        ) 
      )
    else: itemList[itemMan.code_name] = desired
  )
  # if itemList.has(desired.name):
  #   if desired.get_node("CountManager"):
  #     itemList[desired.name][0] += desired.get_node("CountManager").count
  #   else:
  #     itemList[desired.name].append(desired)
  
  # else:
  #   itemList[desired.name] = [desired]
  Signals.UpdateUI.emit()

func isAvailable(item) -> bool:
  # return bool(itemList[item])
  if item is String and itemList.has(item):
    return bool(itemList[item])
  elif item is Node and itemList.has(item.get_node("ItemManager").code_name):
    return bool(itemList[item.get_node("ItemManager").code_name])
  else: return false

func hasAmount(item: String, amount) -> bool:
  var hasAm : bool = false
  Util.Count(itemList[item], 
    func(countMan): hasAm = countMan.count <= amount
  )
  return hasAm
func access(item: String, amount := 1):
  return isAvailable(item) and hasAmount(item, amount)

func get_item(item):
  if item is String and itemList.has(item): 
    return itemList[item]
  elif item is Node:
    Util.Item(item, func(man): if itemList.has(man.code_name): return itemList[man.code_name])

