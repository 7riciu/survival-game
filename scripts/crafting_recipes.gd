extends Node

const RECIPES = {
	"sword": {
		"icon": preload("res://assets/pickaxe.png"),
		"description": "sword",
		"action": "craft_sword",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
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
		"icon": preload("res://assets/pickaxe.png"),
		"description": "axe",
		"action": "craft_axe",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"campfire": {
		"icon": preload("res://assets/pickaxe.png"),
		"description": "campfire",
		"action": "craft_campfire",
		"requires": {
			"wood": 10
		}
	}
}
