extends Node2D

var checkhandle = true


func _ready():
	pass


# left side diamond and liver
func _on_dimond_body_entered(_body):
	if _body.name == 'seteve':
		$dimond/collect_diamond.play()
		$dimond/AnimationPlayer.play("collect_diamond")


func _on_AnimationPlayer_animation_finished(_anim_name):
	if _anim_name == 'collect_diamond':
		$dimond.queue_free()


func _on_liver_body_entered(_body):
	if checkhandle:
		$liver/Sprite.texture = load("res://level2/gate handle/tile_0064.png")
		$dimond/AnimationPlayer.play("dimond1")
		checkhandle = false


#center liver and diamond

