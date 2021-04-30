extends KinematicBody2D

var speed = 350
var jump_speed = 900
var gravity = 1300

var swim = false
var cont = 0
var text_actual = null
var shield = false
var open_door = false

var distance = Vector2()
var velocity = Vector2()
var direction = Vector2()


func _ready():
	set_physics_process(true)
	set_process(true)
	
	$spr.frame = 3

func _process(delta):
	

	
	if Input.is_action_just_pressed("ui_select") and open_door:
		$spr.animation = "open_door"
		$spr.playing = true
		yield($spr,"animation_finished")
		print("Bien, has pasado el nivel")
		get_tree().quit()
	
	if $time_shield.is_stopped() == false and $spr.self_modulate.a8 != 100:
		$spr.self_modulate.a8 -= 5
	elif $time_shield.is_stopped() and $spr.self_modulate.a8 != 255:
		$spr.self_modulate.a8 += 5
		shield = false
	

	
		





	if $"../../UI/Joystick".is_working:
		if self.is_on_floor() and ($"../../UI/Joystick".output)[0] > -0.5 and ($"../../UI/Joystick".output)[0] < 0.5 and ($"../../UI/Joystick".output)[1] < -0.5:
			velocity.y = -jump_speed
			direction.y = 1
		else:
			var _velocity = move_and_slide($"../../UI/Joystick".output * speed)
			if ($"../../UI/Joystick".output)[0] > 0:
				$spr.flip_h = false
			elif ($"../../UI/Joystick".output)[0] < 0:
				$spr.flip_h = true
	#_move(delta)
	jump_speed = 600
	gravity = 1300
	velocity.y += gravity*delta
	
	move_and_slide(velocity,Vector2(0,-1))






func _on_door_body_entered(body):
	if body.is_in_group('player'):
		global_var.door_entered = true
	pass # Replace with function body.




