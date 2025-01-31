extends CharacterBody2D

const GRAVITY : int = 4900
const JUMP_SPEED : int = -1800


#Called every frame. "delta" is elapsed time since previous frame

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		if not get_parent().game_running:
			$AnimatedSprite2D.play("idle")
		else:
			$runCol.disabled = false
			if Input.is_action_pressed("jump"):
				velocity.y = JUMP_SPEED
				$jump.play()
				
			elif Input.is_action_pressed("duck"):
				$AnimatedSprite2D.play("duck")
				$runCol.disabled = true
			else: 
				$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("jump")
		
	move_and_slide()
