extends CharacterBody2D
<<<<<<< Updated upstream
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _input(event):
	var anim = $CharacterBody2D/Movement #manggil "Movement" child on the scene
	if event.is_action_pressed("Walk Kanan"):
=======

#Moving the Character
var speed = 200.0 

func _physics_process(delta):
	# Stating Vector yang dipake adalah vector2 atau (x,y)
	var direction = Vector2.ZERO
	var anim = $Movement

	if Input.is_action_pressed("Walk Kanan"):
		direction.x += 1
>>>>>>> Stashed changes
		anim.play("Walking")
	elif Input.is_action_pressed("Walk Kiri"):
		direction.x -= 1
		anim.play("Walking")
		
	#Cek lagi karena harusnya dia naik trus turun, y nya harusnya naik tp trus turun
	elif Input.is_action_pressed("Jump"):
		anim.play("Jump")
	#Cek lagi karena harusnya dia turun tpi ga berubah y nya
	elif Input.is_action_pressed("Crouch"):
		anim.play("Crouch")
	
	else:
		anim.play("Standing Idle")

#VELOCITY itu built in systemnya untuk CharacterBody2D. jadi intinya kt nyari Velocity untuk dijadikan Gerakan
	velocity = direction * speed
	move_and_slide()
	print(position)
