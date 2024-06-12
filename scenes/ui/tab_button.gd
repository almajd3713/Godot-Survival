extends Button
class_name TabButton

@export var tab: UI.Tabs = UI.Tabs.NONE
var tabNode: TabDefault


func _ready():
  for tabN in Data.tabs:
    if tabN.tab == tab: 
      tabNode = tabN
      break
  focus_entered.connect(_on_tab_switch)


func _on_tab_switch():
  for tabN in Data.tabs: tabN.visible = false
  tabNode.visible = true
  pass