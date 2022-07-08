extends KinematicBody2D

export (int) var speed = 100
export (int) var jump_speed = 210
export (int) var gravity = 500
export (int) var health = 3

var velocity = Vector2.ZERO
onready var animsprite = $AnimatedSprite

func get_input():
	velocity.x = 0
	if velocity.y != 0:
		animsprite.play("jump")
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

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = -jump_speed
			


func _on_Area2D_body_entered(body):

	health = health - 3
	global_position.x = 70
	global_position.y = 30
	



func _on_Area2D2_body_entered(body):
	health = health - 3
	global_position.x = 70
	global_position.y = 30


func _on_Area2D11_body_entered(body):
	health = health - 3
	global_position.x = 70
	global_position.y = 30



func _on_Area2D12_body_entered(body):
	health = health - 3
	global_position.x = 70
	global_position.y = 30


func _on_Area2D3_body_entered(body):
	global_position.x = 70
	global_position.y = 30


func _on_Area2D4_body_entered(body):
	pass # Replace with function body.
	


func _on_Area2D5_body_entered(body):
	pass # Replace with function body.


func _on_Area2D6_body_entered(body):
	pass # Replace with function body.


func _on_Area2D7_body_entered(body):
	pass # Replace with function body.


func _on_Area2D8_body_entered(body):
	pass # Replace with function body.


func _on_Area2D9_body_entered(body):
	pass # Replace with function body.


func _on_Area2D10_body_entered(body):
	pass # Replace with function body.
