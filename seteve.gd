extends KinematicBody2D

var velocity = Vector2(0,0) 
var coins = 0
const speed = 180
const gravity = 35
const jumpforce = -950

func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		velocity.x = speed 
		$Sprite.play("walk")
		$Sprite.flip_h = false
	
	elif Input.is_action_pressed("Left"):
		velocity.x = -speed
		$Sprite.play("walk")
		$Sprite.flip_h = true
	
	else:
		$Sprite.play("idel")
	
	if not is_on_floor():
		$Sprite.play("jump")
		
	velocity.y = velocity.y + gravity #jump part
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jumpforce
		$sound_jump.play()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.5)
	
	
func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://over.tscn")
	
	
func bounce():
	velocity.y = jumpforce * 0.7
	
func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = jumpforce * 0.5
	
	if position.x < enemyposx:
		velocity.x = -1000 
		
	elif position.x > enemyposx:
		velocity.x = 1000
	
	Input.action_release("Right")
	Input.action_release("Left")
	
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://over.tscn")
