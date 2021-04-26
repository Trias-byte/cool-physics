extends KinematicBody2D

class_name Player

export var speed : float = 200

export (NodePath) var joystickLeftPath
onready var joystickLeft : Joystick = get_node(joystickLeftPath)


func _physics_process(_delta):
	if joystickLeft and joystickLeft.is_working:
		var _velocity = move_and_slide(joystickLeft.output * speed)
	

