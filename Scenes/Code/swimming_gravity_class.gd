class_name Swim_Gravity_Handle
extends Node

@export_subgroup("ControlVariables")
@export var gravity: float = 400.0

var is_swimming: bool = false

func handle_gravity(body: CharacterBody2D, delta: float) -> void:
	if not body.is_on_floor():
		body.velocity.y += gravity * delta
		
	is_swimming = body.velocity.y > 0 and not body.is_on_floor()
