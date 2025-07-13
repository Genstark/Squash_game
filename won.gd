extends Button


func _ready():
	pass


func _on_won_pressed():
	get_tree().change_scene("res://level2/level2.tscn")
