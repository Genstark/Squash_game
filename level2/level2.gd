extends Node2D

var checkhandle1 = true
var checkhandle2 = true
var checkhandle3 = true
var collect_diamond = 0

func _ready():
	$HOD/Coin.text = '0'


# left side diamond and liver
func _on_dimond_body_entered(_body):
	if _body.name == 'seteve':
		$dimond/collect_diamond.play()
		$dimond/AnimationPlayerDiamond.play("collect_diamond")
		collect_diamond += 1
		$HOD/Coin.text = String(collect_diamond)


func _on_AnimationPlayer_animation_finished(_anim_name):
	if _anim_name == 'collect_diamond':
		$dimond.queue_free()


func _on_liver_body_entered(_body):
	if _body.name == 'seteve':
		if checkhandle1:
			$liver/Sprite.texture = load("res://level2/gate handle/tile_0064.png")
			$dimond/AnimationPlayerDiamond.play("dimond1")
			checkhandle1 = false


#center liver and diamond


func _on_liver2_body_entered(_body):
	if _body.name == 'seteve':
		if checkhandle2:
			$liver2/Sprite.texture = load("res://level2/gate handle/tile_0066.png")
			$dimond2/AnimationPlayerDiamond2.play("up-diamond")
			$dimond3/AnimationPlayerDiamond3.play("up-diamond")
			checkhandle1 = false


func _on_dimond2_body_entered(_body):
	if _body.name == 'seteve':
		$dimond2/collect_diamond.play()
		$dimond2/AnimationPlayerDiamond2.play("collect-diamond")
		collect_diamond += 1
		$HOD/Coin.text = String(collect_diamond)


func _on_AnimationPlayerDiamond2_animation_finished(_anim_name):
	if _anim_name == 'collect-diamond':
		$dimond2.queue_free()


func _on_dimond3_body_entered(_body):
	if _body.name == 'seteve':
		$dimond3/collect_diamond.play()
		$dimond3/AnimationPlayerDiamond3.play("collect-diamond")
		collect_diamond += 1
		$HOD/Coin.text = String(collect_diamond)

func _on_AnimationPlayerDiamond3_animation_finished(_anim_name):
	if _anim_name == 'collect-diamond':
		$dimond3.queue_free()


#right liver and diamond
func _on_liver3_body_entered(_body):
	if checkhandle3:
		if _body.name == 'seteve':
			$liver3/Sprite.texture = load("res://level2/gate handle/tile_0066.png")
			$dimond4/AnimationPlayerDiamond4.play("up-diamond")
			checkhandle3 = false


func _on_dimond4_body_entered(_body):
	if _body.name == 'seteve':
		$dimond4/collect_diamond.play()
		$dimond4/AnimationPlayerDiamond4.play("collect-diamond")
		collect_diamond += 1
		$HOD/Coin.text = String(collect_diamond)

func _on_AnimationPlayerDiamond4_animation_finished(_anim_name):
	if _anim_name == 'collect-diamond':
		$dimond4.queue_free()
