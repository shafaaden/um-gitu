extends CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _input(event):
	var anim = $CharacterBody2D/Movement #manggil "Movement" child on the scene
	if event.is_action_pressed("Walk Kanan"):
		anim.play("Walking")
	elif event.is_action_pressed("Crouch"):
		anim.play("Crouch Transition")
	elif event.is_action_pressed("Walk Kanan"):
		anim.play("Walking")
	
	
	#Tambahin On Air idlenya
	elif event.is_action_pressed("Jump"): 
		pass
	
	# ELSE berdiri idle
	else:
		anim.play("Standing Idle")

func _process(_delta):
	var anim = $CharacterBody2D/Movement
	if Input.is_action_pressed ("Crouch"):
		if anim.animation != "Crouch Idle" :
			anim.play("Crouch Idle")

	
	
