extends Sprite
onready var GUI =get_node('/root/GUI')
const RADIUS =97.5
const SMALL_RADIUS =36.5
var stick_pos
var evt_index =-1

func _init():
	stick_pos = position
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if stick_pos.distance_to(event.position) < RADIUS:
				evt_index = event.index
		elif evt_index != -1:
			if evt_index == event.index:
				evt_index=-1
				$Small.position = Vector2()
				GUI.stick_speed = 0
				GUI.stick_vector = Vector2()
				GUI.stick_angle = 0
				
	if evt_index!=-1 && event is InputEventScreenDrag:
		var dist = stick_pos.distance_to(event.position)
		var vect = (event.position -stick_pos).normalized()
		if dist+SMALL_RADIUS > RADIUS: dist=RADIUS- SMALL_RADIUS
		GUI.stick_speed = dist
		GUI.stick_angle = event.position.angle_to_point(stick_pos)
		GUI.stick_vector = vect
		$Small.position = vect* dist
		print(GUI.stick_vector)
		
			
