extends Node

const RECIPES = {
	"sword": {
		"icon": preload("res://assets/pickaxe.png"),
		"requires": {
			"wood": 10,
			"stone": 10
		}
	},
	
	"pickaxe": {
		"icon": preload("res://assets/pickaxe.png"),
		"requires": {
			"wood": 10,
			"stone": 10
		}
	}
}
