extends CharacterBody2D

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

@export var MOVE_SPEED : float = 100.0
@export var JUMP_VELOCITY : float = -400.0
@export var START_DIRECTION : Vector2 = Vector2(0, 1)

func _ready():
	animation_tree.set("parameters/idle/blend_position", START_DIRECTION)

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	update_animation_parameters(input_direction)
	
	velocity = input_direction * MOVE_SPEED
	print("Input= ", input_direction)
	print("Velocity= ", velocity)
	
	pick_new_state()
	
	move_and_slide()
	
func update_animation_parameters(move_input : Vector2):
	if(move_input != Vector2.ZERO):
		animation_tree.set("parameters/walk/blend_position", move_input)
		animation_tree.set("parameters/idle/blend_position", move_input)
		
func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("walk")
	else:
		state_machine.travel("idle")
		
