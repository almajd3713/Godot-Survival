extends MarginContainer
class_name ActionBlock

@export var action: Action
@onready var header = $PanelContainer/MarginContainer/VBoxContainer/Label
@onready var startActionBtn = $PanelContainer/MarginContainer/VBoxContainer/Button
@onready var description = $PanelContainer/MarginContainer/VBoxContainer/RichTextLabel
@onready var actionTimer = $ActionTimer
@onready var progBarContainer = $PanelContainer/MarginContainer/VBoxContainer/ProgressBarContainer
@onready var progBar = $PanelContainer/MarginContainer/VBoxContainer/ProgressBarContainer/MarginContainer/ProgressBar

func _ready():
  update_ui()
  startActionBtn.pressed.connect(_on_start_action)
  progBar.max_value = action.baseTime
  actionTimer.timeout.connect(_on_action_increment)
  startActionBtn.add_to_group("actionBtns")
  progBarContainer.modulate = Color.TRANSPARENT

  # tween.set_loops()
  # print(progBar)
  # tween.tween_property(progBar, "value", progress, actionTimer.wait_time)



## Tweener for progBar

func update_ui():
  header.text = action.name
  description.text = "[center]" + action.desc + "[/center]"

var progress := 0
func _on_start_action():
  actionTimer.timeout.emit()
  actionTimer.start()   
  progBarContainer.modulate = Color (1,1,1,1)
  get_tree().set_group("actionBtns", "disabled", true)

func _on_action_increment():
  var tween = create_tween()

  if progBar.value + 1 > action.baseTime:
    action.claim()
    progress = 0
    tween.tween_property(progBar, "value", progress, 0)
    get_tree().set_group("actionBtns", "disabled", false)
    progBarContainer.modulate = Color.TRANSPARENT


    actionTimer.stop()
  else:
    progress += 1
    tween.tween_property(progBar, "value", progress, actionTimer.wait_time)

  # progress += 1
  # if progress > action.baseTime:
    # action.claim()
    # progress = 0
    # startActionBtn.disabled = false
    # actionTimer.stop()