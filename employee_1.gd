extends Sprite2D

signal arrived
signal left

func walk_in():
	$AnimationPlayer.play("walking")
	$PositionAnimationPlayer.play("employee_enter_left")
	pass

func walk_out():
	$AnimationPlayer.play("walking")
	$PositionAnimationPlayer.play("employee_leave_right")
	pass

func _on_position_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "employee_enter_left":
		$AnimationPlayer.stop()
		emit_signal("arrived")
	elif anim_name == "employee_leave_right":
		$AnimationPlayer.stop()
		emit_signal("left")
