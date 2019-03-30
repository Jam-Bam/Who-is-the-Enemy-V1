extends KinematicBody2D

const SPEED = 70

const movedir = Vector2(0,0)
var lastmotion
func _physics_process(delta):
	controls_loop()
	movement_loop()


func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)

func movement_loop():
	var motion = movedir.normalized() * SPEED
	
	move_and_slide(motion, Vector2(0,0))
	if motion.x < 0:
		$Sprite.play("walks")
		$Sprite.flip_h = false
		lastmotion = "l"
	elif motion.x > 0:
		$Sprite.play("walks")
		$Sprite.flip_h = true
		lastmotion = "r"
	elif motion.y > 0:
		$Sprite.play("walkd")
		$Sprite.flip_h = false
		lastmotion = "d"
	elif motion.y < 0:
		$Sprite.play("walku")
		$Sprite.flip_h = false
		lastmotion = "u"
	else:
		if lastmotion == "d":
			$Sprite.play("idled")
		elif lastmotion == "u":
			$Sprite.play("idleu")
		elif lastmotion == "l":
			$Sprite.play("idles")
			$Sprite.flip_h = false
		elif lastmotion == "r":
			$Sprite.play("idles")
			$Sprite.flip_h = true
		