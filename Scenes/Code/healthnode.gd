class_name HealthNode
extends Node

@export var HP: int = 5

func _process(_delta):
	if HP <= 0:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	
