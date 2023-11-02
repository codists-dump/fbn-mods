extends FNFScript

var start_scale

var start_position

var start_rotation

var cur_flip = false

var different_flip = false

func _get_features():
	return ["characters/alt_animation"]

func _loaded():
	run_feature("characters/alt_animation", "register_character", [character])

func _process(_delta):
	if start_scale != null:
		if not character.can_bop():
			character.scale = start_scale
	elif character.created:
		start_scale = character.scale
		start_position = character.sprite.position
		start_rotation = character.icon.rotation_degrees
	
	if character.icon != null:
		if character.icon.frame == 1:
			var _random = rand_range(-5, 5)
			character.icon.rotation_degrees = start_rotation + _random
		else:
			character.icon.rotation_degrees = start_rotation

func _on_beat(_beat):
	cur_flip = !cur_flip

	if character.can_bop():
		character.play("idle")

		if cur_flip == false:
			character.scale.x = start_scale.x
		else:
			character.scale.x = -start_scale.x

	if character.icon != null:
		if character.icon.frame != 1:
			character.icon.flip_h = cur_flip

func _on_step(_step):
	if int(_step) % 2 == 0:
		if character.icon.frame == 1:
			different_flip = !different_flip
			character.icon.flip_h = different_flip
