extends CharacterBody2D

@export var grounded_gravity_control: Ground_Gravity_Handle
@export var grounded_input_control: Ground_Input_Handle
@export var animation_control: Animation_Handle
@export var swimming_gravity_control: Swim_Gravity_Handle
@export var swimming_input_control: Swim_Input_Handle

var is_underwater: bool = false

func _physics_process(delta: float) -> void:
	if self.is_underwater == false:
		grounded_gravity_control.handle_gravity(self, delta)
		grounded_input_control.movement_handle(self, grounded_input_control.x_movement)
		if self.is_on_floor():
			grounded_input_control.jump_handle(self, grounded_input_control.get_jump_input())
		else:pass
		animation_control.move_animation(grounded_input_control.x_movement)
		animation_control.jump_animation(grounded_input_control.jumped, grounded_gravity_control.is_falling)
		animation_control.dash_animation(grounded_input_control.is_dashing)
	
	elif self.is_underwater == true:
		swimming_gravity_control.handle_gravity(self, delta)
		swimming_input_control.swim_handle(self, swimming_input_control.x_movement)
		swimming_input_control.swimup_handle(self, swimming_input_control.get_jump_input())
		swimming_input_control.boat_handle(self, swimming_input_control.x_movement)
	
	
	move_and_slide()

func _on_area_2d_body_entered(_body):
	self.is_underwater = true

func _on_area_2d_body_exited(_body):
	self.is_underwater = false
