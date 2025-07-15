extends Button


func _ready():
	pass


func _on_won_pressed():
	get_tree().change_scene("res://tile_menu.tscn")
