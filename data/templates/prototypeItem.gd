extends Resource
class_name PrototypeItem

signal itemEnded

@export var item_name := "New Item"
@export var code_name := "new_item"

@export_multiline var description := "Item Description"

@export var icon: Texture2D


# var _count = 0
# @export var count : int:
#   get: return _get_count()
#   set(newVal): _set_count(newVal)

# func _get_count():
#   return _count;

# func _set_count(newVal):
#   _count = newVal


# func produce(amount: int) -> bool:
#   count += amount
#   return true

# func consume(amount: int) -> bool:
#   if count - amount >= 0:
#     count -= amount
#     return true
#   else: 
#     return false



# func produce(amount: int) -> bool:
#   count += amount
#   return true

# func consume(amount: int) -> bool:
#   if count - amount >= 0:
#     count -= amount
#     return true
#   else: 
#     return false