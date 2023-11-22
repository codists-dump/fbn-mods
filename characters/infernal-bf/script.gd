extends FNFScript


func _get_features():
	return ["characters/3-icon-set"]

func _loaded():
	run_feature("characters/3-icon-set", "register_character", [character])