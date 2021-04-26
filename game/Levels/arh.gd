extends KinematicBody2D
var text_actual = null
var num_of_text = 0
var text = ['-Кто там?',
	'-Эй, ты за дверью, помоги мне. Я не могу выбраться, а дверь захлопнулась.',
	'-Чтобы я смог вылезти, нужно поднять уровень воды.',
	'-Как это сделать? Легко - за этой двеью водоем соеденен с первым резервуаром, а после него идет еще один. Нужно Поднять уровень воды во втором водоемы кинув что нибудь в третий. Выбери что нибудь с высокой плотностью и большим объемом.',
	'-Почему именно так? Потому что я открыл закон, по которому работает выталкивающая сила.',
	'-Сила, выталкивающая целиком погруженное в жидкость или в газ тело, равна весу жидкости или газа в объеме этого тела.', 
	'-Чтобы все правильно посчитать, я дам тебе формулу которую надавно придумал.' ]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _process(delta):
	if global_var.upp == true:
		move_local_x(100)
		move_local_y(-20)
		global_var.upp = false
		if text_actual != null:
			text_actual.queue_free()
		global_var.door_opened = true
		_speak('Спасибо что помог Давай выбираться отсюда!')
		$"../door/door_anim".play('default', true)
		$"../door/StaticBody2D/CollisionShape2D".set_disabled(true)
		global_var.door_entered == false
	


func _speak(text):
	var container_text = load("res://Text/Label.tscn").instance()
	container_text._text(text)
	add_child(container_text)
	text_actual = container_text
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_up():
	if global_var.door_entered == true:
		if text_actual != null:
			text_actual.queue_free()
		if num_of_text <=6:
			_speak(text[num_of_text])
		else:
			_speak('- F=P*g*V')
		num_of_text+=1
