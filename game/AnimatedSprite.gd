extends AnimatedSprite
var done = false


func _on_Area2D_body_entered(body):
	if body.is_in_group('stone'):
		play('true_water', true)
		done = true
		wait(1.1)
	if body.is_in_group('wood') and done == false:
		play('false_water' , true)
		$"../../box_wood".apply_central_impulse(Vector2(0,-50000))
		$"../../box_wood".set_mode(3)
		
func wait(s):
	var t = Timer.new()
	t.set_wait_time(s)
	t.set_one_shot(true)
	add_child(t)
	t.start()
	yield(t, "timeout")
	t.queue_free()
	global_var.upp = true
