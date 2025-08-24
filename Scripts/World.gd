extends Node
var tasks_left = 0

func _on_ceo_arrived_at_desk() -> void:
	#$Control.visible = true
	$HUD.update_company_state()
	$HUD.visible = true
	
func _on_button_a_pressed() -> void:
	if $TaskControl.current_task.has("effects_a"): 
		CompanyState.apply_effects($TaskControl.current_task.get("effects_a"))
		$HUD.update_company_state()
	else:
		push_error("Tasks data seems to be corrupt: effects_a missing for ", $TaskControl.current_task)
	if tasks_left > 0:
		tasks_left -= 1
		$TaskControl.openTask()
	else:
		_end_quarter()
	
func _on_button_b_pressed() -> void: 
	if $TaskControl.current_task.has("effects_b"):
		CompanyState.apply_effects($TaskControl.current_task.get("effects_b"))
		$HUD.update_company_state()
	else:
		push_error("Tasks data seems to be corrupt: effects_b missing for ", $TaskControl.current_task)
	if tasks_left > 0:
		tasks_left -= 1
		$TaskControl.openTask()
	else:
		_end_quarter()
		
func _next_quarter():
	$QuarterControl/NextQuarterButton.visible = false
	$TaskControl.openTask()
	$TaskControl.visible = true
	tasks_left = 2

func _end_quarter():
	CompanyState.quarter_update()
	$HUD.update_company_state()
	$TaskControl.visible = false
	var game_over = CompanyState.is_game_over()
	if game_over[0]:
		$GameOverControl/VBoxContainer/GameOverLabel.text = "GAME OVER\n" + game_over[1]
		$GameOverControl.visible = true
	else:
		$QuarterControl/NextQuarterButton.visible = true
