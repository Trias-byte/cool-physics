extends AnimatedSprite
# var a = 2
# var b = "text
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Area2D_body_entered(body):
	var box_stone = get_node('stone')
	print(box_stone)
	print(body)
	print('yr')
	play('true_water', true)
	pass # Replace with function body.


