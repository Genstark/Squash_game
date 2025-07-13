extends Area2D

signal coin_collected

func _on_coin_body_entered(_body):
	$AnimationPlayer.play("bounce")
	emit_signal("coin_collected")
	set_collision_mask_bit(0,false)
	$coincollectsound.play()
	
	
func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
