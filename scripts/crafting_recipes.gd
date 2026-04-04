extends Node

const RECIPES = {
	"life_elexir": {
		"icon": preload("res://assets/life_elexir.png"),
		"description": "life elexir: 10 berries",
		"action": "craft_life_elexir",
		"requires": {
			"berry": 10
		}
	},
	
	"pickaxe": {
		"icon": preload("res://assets/pickaxe.png"),
		"description": "pickaxe: 10 wood, 10 stone",
		"action": "craft_pickaxe",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"axe": {
		"icon": preload("res://assets/axe.png"),
		"description": "axe: 10 wood, 10 stone",
		"action": "craft_axe",
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"campfire": {
		"icon": preload("res://assets/campfire_fire.png"),
		"description": "campfire: 10 wood",
		"action": "craft_campfire",
		"requires": {
			"wood": 10
		}
	}
}
