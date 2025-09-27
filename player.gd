extends CharacterBody2D


const SPEED = 50.0

@onready var animation := $AnimatedSprite2D as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
		animation.play("FeliciadeLado")
		animation.scale.x = directionx
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("FeliciaParada")
		
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
		if directiony == 1:
			animation.play("FeliciaFrente")
		if directiony == -1:
			animation.play("FeliciaCostas")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
