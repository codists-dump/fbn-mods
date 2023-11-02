extends FNFScript

func register_character(character):
	print("registering" + str(character))
	if (character == null):
		return
	
	character.connect("taunted", self, "_on_taunt", [character])

func _on_taunt(_alt_key, _character):
	_character.do_taunt_sound = not _alt_key
	
	if _alt_key:
		if _character.anim_prefix == "":
			_character.anim_prefix = "-alt"
			_character.play("transALTin", 1)
		else:
			_character.anim_prefix = ""
			_character.play("transALTout", 1)
