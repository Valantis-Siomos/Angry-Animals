extends Node



const ANIMAL = preload("uid://d3d8k073apuom")
@onready var start: Marker2D = $Start



func _ready() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)
	spawn_animal()

func spawn_animal() -> void:
	var animal: Animal = ANIMAL.instantiate()
	animal.position = start.position
	#add_child(animal)
	call_deferred("add_child", animal)
