extends FNFScript


func _get_features():
	return ["characters/alt_animation"]

func _loaded():
	run_feature("characters/alt_animation", "register_character", [character])