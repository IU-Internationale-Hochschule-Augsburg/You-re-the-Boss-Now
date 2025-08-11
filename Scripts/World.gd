extends Node


func _on_ceo_arrived_at_desk() -> void:
	#$Control.visible = true
	$HUD.update_company_state()
	$HUD.visible = true
	$TaskControl.openTask()
	$TaskControl.visible = true
	
	
