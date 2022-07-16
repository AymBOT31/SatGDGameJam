extends KinematicBody2D
export (int) var gravity = 500
export (int) var health = 10
export (int) var speed = 700
var velocity = Vector2.ZERO

#oh the misery


onready var animsprite = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_VisibilityNotifier2D_screen_exited():
	pass
#oh the misery
# Called when the node enters the scene tree for the first time.


func _physics_process(delta):
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
