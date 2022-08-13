extends KinematicBody2D
export (int) var gravity = 0
export (int) var health = 500
export (int) var speed = 10
var velocity = Vector2.ZERO
var chasing = false


#oh the misery


onready var animsprite = $AnimatedSprite
onready var animplayer = $AnimationPlayer
onready var obj = get_parent().get_node("Player")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_VisibilityNotifier2D_screen_exited():
	pass
#oh the misery
# Called when the node enters the scene tree for the first time.


func _physics_process(delta):
	

	
	#if chasing == true:
#		var dir = (obj.global_position.x - global_position.x)
#		move_and_collide(dir * speed * delta)
		#animsprite.play ("walk")
	#else:
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2.UP)
		animsprite.play ("idle")

		if health == 0:
			animsprite.play ("death")
			set_physics_process(false)
			$CollisionShape2D.disabled = true
			queue_free()

		
		
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	




func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		chasing = true


	


func _on_Area2D_body_exited(body):
	if body.is_in_group("Player"):
		chasing = false
	
