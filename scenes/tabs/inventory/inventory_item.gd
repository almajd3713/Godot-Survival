extends PanelContainer

## Required
var item: Node
# ## Optional
# @export var countData: CountManager
# ## Optional
# @export var durData: DurabilityManager



func _ready():
  gui_input.connect(_on_click)
  mouse_entered.connect(_on_cursor_toggle.bind(true))
  mouse_exited.connect(_on_cursor_toggle.bind(false))
  Signals.UpdateUI.connect(update_ui)
  update_ui()


func _on_click(e):
  if e is InputEventMouseButton and e.pressed == true:
    Signals.InventoryItemShow.emit(item)

func update_ui():
  print("AA")
  if item:
    Util.Item(item, func(manager):
      %InventoryName.text = manager.item_name
      %InventoryIcon.texture = manager.icon
    )

func _on_cursor_toggle(entered: bool):
  if entered:
    set_default_cursor_shape(Control.CURSOR_POINTING_HAND) 
  else:
    set_default_cursor_shape(Control.CURSOR_ARROW) 
