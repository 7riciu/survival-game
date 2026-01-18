extends Node

const RECIPES = {
	"sword": {
		"icon": preload("res://assets/pickaxe.png"),
		"description": "sword",
		"action": "buy_sword",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"pickaxe": {
		"icon": preload("res://assets/pickaxe.png"),
		"description": "pickaxe",
		"action": "buy_pickaxe",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"axe": {
		"icon": preload("res://assets/pickaxe.png"),
		"description": "axe",
		"action": "buy_axe",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	}
}
