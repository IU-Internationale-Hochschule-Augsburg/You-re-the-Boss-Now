extends Sprite2D

signal arrived_at_desk

func _ready() -> void:
	$AnimationPlayer.play("walking")
	$PositionAnimationPlayer.play("enter_left")

func _on_position_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "enter_left":
		$AnimationPlayer.stop()
		emit_signal("arrived_at_desk")
