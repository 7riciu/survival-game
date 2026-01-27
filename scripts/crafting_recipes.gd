extends Node

const RECIPES = {
	"pickaxe": {
		"icon": preload("res://assets/pickaxe.png"),
		"description": "pickaxe",
		"action": "craft_pickaxe",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"axe": {
		"icon": preload("res://assets/axe.png"),
		"description": "axe",
		"action": "craft_axe",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"campfire": {
		"icon": preload("res://assets/campfire_fire.png"),
		"description": "campfire",
		"action": "craft_campfire",
		"requires": {
			"wood": 10
		}
	}
}
