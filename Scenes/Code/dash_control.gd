class_name Dash_Handle
extends Node

@export_subgroup("ControlVariables")
@export var dash_speed: float = 1500.0
@export var dash_distance: float = 1.0

#func time_start(dist):
	#wait_time = dist
	#start()

#func dashing():
	#return is_stopped()

#func dash_handle():
	#time_start(dash_distance)
