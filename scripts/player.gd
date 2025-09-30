extends CharacterBody2D


const SPEED = 50.0

@onready var animation := $Sprite2D as AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx := Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * SPEED
		animation.play("walkRight")
		animation.scale.x = directionx
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("default")
		
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
		if directiony == 1:
			animation.play("walkDown")
		elif directiony == -1:
			animation.play("walkUp")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
