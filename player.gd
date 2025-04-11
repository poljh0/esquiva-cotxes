extends Area2D
signal hit
var can_move = false
signal won

@export var speed = 400 # How fast the player will move (pixels/sec).

func _ready():
	hide()

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if can_move:
		velocity.x += 1
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1

	if velocity.length()>0:
		velocity = velocity.normalized() * speed
	position += velocity * delta



func _on_body_entered(body: Node2D) -> void:
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	can_move = false
	if body.name == "MetaFinal":
		won.emit()
	else:
		hit.emit()

	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	can_move = true
