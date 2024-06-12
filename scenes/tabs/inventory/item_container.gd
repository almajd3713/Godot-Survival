extends GridContainer

var inventory_item_scene = preload("res://scenes/tabs/inventory/inventory_item.tscn")

func _ready():
  # Viewport.size_changed.connect(column_set)
  get_window().size_changed.connect(column_set)
  column_set()
  Signals.UpdateUI.connect(update_ui)
  gui_input.connect(_on_click)
  
func update_ui():
  for c in get_children(): c.queue_free()
  for item in Data.player.inventory.itemList:
    var inventory_item = inventory_item_scene.instantiate()
    inventory_item.item = Data.player.inventory.itemList[item]
    add_child(inventory_item)

func _on_click(e):
  if e is InputEventMouseButton and e.pressed == true:
    %InventoryViewManager.selectedItem = null
    %ItemDescription.visible = false
  



func column_set():
  var winSize := get_window().size[0] - 350
  var col := floor(winSize / 100) as int
  if col > 0: 
    columns = col