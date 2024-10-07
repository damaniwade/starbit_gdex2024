class_name Enemy_Animation_Handle
extends Node

@export_subgroup("ControlVariables")
@export var sprite: AnimatedSprite2D

#code to handle the walking animation facing left or right
#a more simple way to set the animation instead of checking
#if the player is walking left or right.
func anim_flip(direction: float) -> void:
	if direction == 0:
		return
	
	if direction < 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func move_animation(direction: float) -> void:
	anim_flip(direction)
	
	if direction != 0:
		sprite.play("Walk")
