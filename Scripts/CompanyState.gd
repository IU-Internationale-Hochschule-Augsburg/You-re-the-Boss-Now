extends Node

@export var capital = 100000
@export var monthly_turnover = 160000
@export var running_costs = 50000
@export var product_portfolio = 1
@export var public_relations = .1
@export var employee_count = 10
@export var employee_satisfaction = .7

func apply_effects(effects: Dictionary) -> void:
	for key in effects.keys():
		if self.has_method(key):
			self.set(key, self.get(key) + effects[key])
		clamp_metrics()

func clamp_metrics() -> void:
	public_relations = clamp(public_relations, 0.0, 1.0)
	employee_satisfaction = clamp(employee_satisfaction, 0.0, 1.0)
	product_portfolio = max(product_portfolio, 0)
	employee_count = max(employee_count, 0)
	capital = max(capital, 0)
	running_costs = max(running_costs, 10000)

func get_state() -> Dictionary:
	return{
		"capital": capital,
		"monthly_turnover": monthly_turnover,
		"running_costs": running_costs,
		"public_relations": public_relations,
		"employee_count": employee_count,
		"employee_satisfaction": employee_satisfaction
	}
