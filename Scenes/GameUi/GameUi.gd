extends Control

var _total_cups: int = 0
var _current_cups: int = 0
var _attempts: int = -1

@onready var vb_complete: VBoxContainer = $VbComplete
#@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var music: AudioStreamPlayer2D = $Music
@onready var attempts_label_2: Label = $MC/VB/HBAttempts2/AttemptsLabel2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	_total_cups = get_tree().get_nodes_in_group(Cup.GROUP_NAME).size()
	SignalHub.on_cup_destroyed.connect(on_cup_destroyed)
	SignalHub.on_attempt_made.connect(on_attempt_made)
	on_attempt_made()

func on_attempt_made() -> void:
	_attempts += 1
	attempts_label_2.text = " %d" % _attempts

func on_cup_destroyed() -> void:
	_current_cups += 1
	if _current_cups == _total_cups:
		vb_complete.show()
		music.play()
		get_tree().paused = true
