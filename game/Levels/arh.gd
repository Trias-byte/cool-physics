extends KinematicBody2D
var text_actual = null
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
			#text_actual.queue_free()
		_speak("tekst podskazki")
	if global_var.upp == true:
		move_local_x(100)
		move_local_y(-20)
		global_var.upp = false

	
	
	

func _speak(text):
	var container_text = load("res://Text/Label.tscn").instance()
	container_text._text(text)
	add_child(container_text)
	text_actual = container_text
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
