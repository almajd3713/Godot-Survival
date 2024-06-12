extends Node
class_name InventoryViewManager


@onready var itemDesc = $"../MarginContainer/VBoxContainer/ItemDescription" 
@onready var inventoryNodes = $"../MarginContainer/VBoxContainer/ScrollContainer/ItemsContainer"

var selectedItem: Node

func _ready():
  Signals.InventoryItemShow.connect(_on_item_show)
  Signals.UpdateUI.connect(update_ui)
  update_ui()


func update_ui():
  %ItemName.text = ""
  %ItemDesc.text = ""
  %ItemCount.text = ""
  %ItemDur.text = ""
  %ItemIcon.texture = null

  if selectedItem:
    %ItemDescription.visible = true
    %ItemName.text = selectedItem.get_node("ItemManager").item_name
    %ItemDesc.text = selectedItem.get_node("ItemManager").description
    %ItemIcon.texture = selectedItem.get_node("ItemManager").icon
    for manager in selectedItem.get_children():
      if manager is CountManager:
        %ItemCount.text = str("Count: ", selectedItem.get_node("CountManager").count)
      if manager is DurabilityManager:
        %ItemDur.text = str("Durability: ", selectedItem.get_node("DurabilityManager").durability)
  else:
    %ItemDescription.visible = false


func _on_item_show(item):
  selectedItem = item
  update_ui()