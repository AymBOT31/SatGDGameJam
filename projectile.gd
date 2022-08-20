extends AnimatedSprite

var velocity = Vector2(1, 0)
var speed = 3



func _physics_process(delta):
	play ("shoot")

	position.x += speed
	
	if velocity.x == 0:
		queue_free()


func on_collision_body_entered():
	queue_free()




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



	


func _on_Area2D_body_entered(body):
	if body.is_in_group ("enemy"):
		body.health = body.health - 20
		queue_free()
