extends Control
class_name TabDefault

@export var tab: UI.Tabs = UI.Tabs.NONE

func _init():
  Data.tabs.append(self)
  visible = false