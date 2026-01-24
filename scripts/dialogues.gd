extends Node

const DIALOGUES = {
	"merchant": {
		"start": {
			"text": "Hello! I'm the merchant.",
			"choices": [
				{ "text": "Next", "next": "start2" }
			]
		},
		"start2": {
			"text": "How can I help you?",
			"choices": [
				{ "text": "Shop", "action": "shop"},
				{ "text": "Back", "action": "start"}
			]
		}
	}
}
