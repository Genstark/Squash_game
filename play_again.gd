extends Button


func _ready():
	pass

func _on_play_again_pressed():
	get_tree().change_scene("res://tile_menu.tscn")
