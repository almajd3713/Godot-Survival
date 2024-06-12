extends Node
class_name ItemManager

var item_name := "New Item"
var code_name := "new_item"

var description := "Item Description"

var icon: Texture2D

@export var data: PrototypeItem:
  set(newVal):
    item_name = newVal.item_name
    code_name = newVal.code_name
    description = newVal.description
    icon = newVal.icon
