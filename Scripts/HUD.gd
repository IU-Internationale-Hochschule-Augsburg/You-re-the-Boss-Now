extends Node

func game_start():
	update_company_state()

func num_shorten(num:int):
	if num >= 1000000:
		return "%smio" % [str(num/1000000.0)]
	elif num >= 1000:
		return "%sk" % [str(num/1000.0)]
	else:
		return str(num)

func update_company_state():
	var states = CompanyState.get_state()
	$CompanyStateContainer/EmployeeSatisfactionLabel.text = "%s%%" % [str(int(states.get("employee_satisfaction") * 100))]
	$CompanyStateContainer/PublicRelationsLabel.text = "%s%%" % [str(int(states.get("public_relations") * 100))]
	$CompanyStateContainer/EmployeeCountLabel.text = str(states.get("employee_count"))
	$CompanyStateContainer/CapitalLabel.text = num_shorten(states.get("capital")) + " €"
	$CompanyStateContainer/RunningCostsLabel.text = num_shorten(states.get("running_costs")) + " €"
	$CompanyStateContainer/MonthlyTurnoverLabel.text = num_shorten(states.get("monthly_turnover")) + " €"
