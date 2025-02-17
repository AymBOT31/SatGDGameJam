extends KinematicBody2D
export (int) var gravity = 100
export (int) var health = 5
export (int) var speed = 5
var velocity = Vector2.ZERO
var chasing = false
var idling = false


#oh the misery


onready var animsprite = $AnimatedSprite
onready var animplayer = $AnimationPlayer
onready var obj = get_parent().get_node("Player")
onready var timer = $Timer
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
	


	
	if chasing == true:
		if obj.global_position.x < 880 and obj.global_position.x > 352:
			velocity.x = obj.global_position.x - global_position.x
			if velocity.x > 0:
				animsprite.set_flip_h(true)
			animsprite.play ("walk")
	elif idling == true:
			
		animsprite.play("idle")
	
	if health <= 0:
		animsprite.play ("death")
		set_physics_process(false)
		$CollisionShape2D.disabled = true
		queue_free()

		
func _on_Area2D16_body_entered(body):
	if body.is_in_group("Player"):
		chasing = true
	


func _on_Area2D16_body_exited(body):
	if body.is_in_group("Player"):
		chasing = false
		idling = true
		
func _on_attack_area_body_entered(body):
	if body.is_in_group("Player"):
		idling = false
		chasing = false
		animsprite.play("attack")
		
		
	

	
	
	


			

func _on_Timer_timeout():
	if idling == false and chasing == false:
		chasing = true
		
	


func _on_AnimatedSprite_animation_finished():
	$Timer.start(1)
	chasing = true
	





func _on_damage_body_entered(body):
		if body.is_in_group("Player"):
			print("dead")
			get_tree().change_scene("deathscene.tscn")
