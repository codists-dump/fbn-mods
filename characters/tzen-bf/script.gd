extends FNFScript

func _ready():
	character.connect("taunted", self, "_on_taunt")
	character.animation_player.connect("animation_finished", self, "_on_animation_finished")

func _on_taunt(_alt_key):
	character.do_taunt_sound = not _alt_key

	if _alt_key:
		if character.anim_prefix == "":
			character.anim_prefix = "-alt"
		else:
			character.anim_prefix = ""
	
	character.play("hey", 1)

func _on_animation_finished(_anim):
	if _anim == "hey-alt":
		character.play("mic", 1)