extends Node
var node = null
var i = 1
func _physics_process(delta):
	while i<1000:
		node = load('res://water.tscn').instance()
		node.set_position(Vector2(150, 640))
		add_child(node)
		node = load('res://water.tscn').instance()
		node.set_position(Vector2(825, 640))
		add_child(node)
		i+=1
