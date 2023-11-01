extends FNFScript

func _get_features():
	return ["characters/alt_animation"]

func _loaded():
	run_feature("characters/alt_animation", "register_character", [character])

func _ready():
	character.connect("taunted", self, "_on_taunt")
	character.animation_player.connect("animation_finished", self, "_on_animation_finished")

func _on_taunt(_alt_key):
	character.play("hey", 1)

func _on_animation_finished(_anim):
	if _anim == "hey-alt":
		character.play("mic", 1)
		character.play("mic", 1)
