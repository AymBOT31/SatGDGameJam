extends KinematicBody2D
export (int) var gravity = 500
export (int) var health = 250
export (int) var speed = 700
var velocity = Vector2.ZERO
signal health_zero

#oh the misery


onready var animsprite = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
#oh the misery
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	animsprite.play ("idle")
	if health == 0:
		animsprite.play ("death")
		set_physics_process(false)
		$CollisionShape2D.disabled = true

		
		
func _process(delta):
	if health <= 0:
		 emit_signal("health_zero")


