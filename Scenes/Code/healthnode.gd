class_name HealthNode
extends Node

@export var HP: int = 5
var p = get_parent()

func _process(_delta):
	if HP <= 0:
		if p.is_in_group("Player"):
			get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

	
