class_name Cup

extends StaticBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func die() -> void:
	animation_player.play("vanish")


func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "vanish":
		queue_free()
