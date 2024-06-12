extends GridContainer



func _ready():
  update_ui()
  # Viewport.size_changed.connect(column_set)
  get_window().size_changed.connect(column_set)




func update_ui():
  for actionPair in Data.actions:
    add_child(actionPair[1])

func column_set():
  var col = floor(size[0] / 275)
  if col > 0: columns = col