extends CanvasLayer

var coins = 0

func _ready():
	$Coin.text = String(coins)


func _on_coin_coin_collected():
	coins += 1
	_ready()
	if coins==20:
		get_tree().change_scene("res://won.tscn")
