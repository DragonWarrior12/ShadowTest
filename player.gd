extends CharacterBody2D

@export var speed = 200
@export var sprite: Sprite2D
@export var lights: Node2D
@export var canvasModulate: CanvasModulate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var space_state = get_world_2d().direct_space_state
	var colour = canvasModulate.color;

	for light: Light2D in lights.get_children():
		var rayParam = PhysicsRayQueryParameters2D.create(position, light.position, light.shadow_item_cull_mask)

		if space_state.intersect_ray(rayParam).is_empty():
			colour += light.color

	sprite.self_modulate = colour

	pass


func _physics_process(delta):
	var inputDir = Input.get_vector("left", "right", "up", "down")
	velocity = inputDir * speed
	move_and_slide()
