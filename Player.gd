extends KinematicBody2D

export (int) var speed = 200
export (int) var jump_speed = 100
export (int) var gravity = 100
var velocity = Vector2.ZERO
onready var animsprite = $AnimatedSprite

func get_input():
	velocity.x = 0
	if velocity.y != 0:
		animsprite.play("Jump")
		if Input.is_action_pressed("ui_right"):
				animsprite.set_flip_h(false)
				velocity.x += speed
		elif Input.is_action_pressed("ui_left"):
				animsprite.set_flip_h(true)
				velocity.x -= speed
	else:
		if Input.is_action_pressed("ui_right"):
			animsprite.set_flip_h(false)
			animsprite.play("Run")
			velocity.x += speed
		elif Input.is_action_pressed("ui_left"):
			animsprite.set_flip_h(true)
			animsprite.play("Run")
			velocity.x -= speed
		else:
			animsprite.play("Idle")
