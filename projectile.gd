extends Sprite

var velocity = Vector2(1, 0)
var speed = 3

func _physics_process(delta):

	position.x += speed
	
	if velocity.x == 0:
		queue_free()






func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()
	


func _on_Area2D_body_entered(body):
	if body.is_in_group ("enemy"):
		body.health = body.health - 10
		queue_free()
