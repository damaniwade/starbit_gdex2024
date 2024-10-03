extends CharacterBody2D

@export var gravity_control: Gravity_Handle
@export var input_control: Input_Handle
@export var animation_control: Animation_Handle

func _physics_process(delta: float) -> void:
	gravity_control.handle_gravity(self, delta)
	input_control.movement_handle(self, input_control.x_movement)
	input_control.jump_handle(self, input_control.get_jump_input())
	animation_control.move_animation(input_control.x_movement)
	animation_control.jump_animation(input_control.jumped, gravity_control.is_falling)
	
	
	move_and_slide()
