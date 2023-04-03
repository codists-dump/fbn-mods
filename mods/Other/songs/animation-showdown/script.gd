extends FNFStage

var player_character
var enemy_character
var gf_character

var enemy_start
var gf_start

var player_gun
var enemy_gun
var gf_gun

var is_3_player = false

var folder = "/assets/animation-showdown/"

onready var songs_folder = Resources.get_parent_directory(script_directory)
onready var mod_folder = Resources.get_parent_directory(songs_folder)
onready var assets_folder = mod_folder + folder

func _get_resources():
	return [
		folder + "bg.png",
		folder + "gun.png",
		folder + "gun forward.png",
	]

func _loaded():
	player_character = stage.player_character
	enemy_character = stage.enemy_character
	gf_character = stage.gf_character

	enemy_start = enemy_character.position
	gf_start = gf_character.position

	if len(stage.fake_characters) > 0:
		is_3_player = true

		gf_character.visible = false
		
		var _first_faker = stage.fake_characters[stage.fake_characters.keys()[0]]
		
		if not play_state.is_odd_player:
			gf_character = _first_faker
		else:
			gf_character = player_character
			player_character = _first_faker

	clear_background()

	var _bg = new_sprite(assets_folder + "bg.png")
	_bg.position = (Vector2(1920, 1080) / 2) + Vector2(0, -300)
	_bg.scale = Vector2.ONE * 3
	_bg.z_index = -10
	stage.add_child(_bg)

	player_gun = new_sprite(assets_folder + "gun.png")
	player_gun.show_behind_parent = true

	player_gun.position.x = -200 * sign(player_character.scale.x)
	player_gun.flip_h = player_character.flip_x
	
	player_gun.visible = false
	player_character.add_child(player_gun)

	enemy_gun = new_sprite(assets_folder + "gun.png")
	enemy_gun.position.x = 200 * sign(enemy_character.scale.x)
	enemy_gun.show_behind_parent = true

	enemy_gun.flip_h = not enemy_character.flip_x

	enemy_gun.visible = false
	enemy_character.add_child(enemy_gun)

	gf_gun = new_sprite(assets_folder + "gun forward.png")
	gf_gun.scale = Vector2.ONE * 0.5
	gf_character.add_child(gf_gun)

	stage.cam_unlocked = true
	stage.return_zoom = Vector2(1.5, 1.5)

	hud.modulate.a = 0
	
	player_character.scale.x = -player_character.scale.x
	camera.position = player_character.position - Vector2(0, 100)
	camera.zoom = Vector2(1, 1)

	enemy_character.position.x -= 200

	gf_character.position.x += 2000


func _process(_delta):
	gun_movement(player_gun, player_character, _delta)
	gun_movement(enemy_gun, enemy_character, _delta)
	gun_movement(gf_gun, gf_character, _delta, 60)

	if player_gun != null:
		player_gun.rotation_degrees = lerp(player_gun.rotation_degrees, 0, _delta * 20)
	if enemy_gun != null:
		enemy_gun.rotation_degrees = lerp(enemy_gun.rotation_degrees, 0, _delta * 20)


func gun_movement(_gun, _player, _delta, _multi = 40):
	if _gun == null:
		return
	
	var _offset = Vector2.ZERO

	if is_instance_valid(_player):	
		var _cur_anim = _player.animation_player.current_animation

		if _cur_anim == "":
			return

		if _cur_anim == "singLEFT":
			_offset = Vector2.LEFT
		elif _cur_anim == "singDOWN":
			_offset = Vector2.DOWN
		elif _cur_anim == "singUP":
			_offset = Vector2.UP
		elif _cur_anim == "singRIGHT":
			_offset = Vector2.RIGHT
	
	_gun.offset = lerp(_gun.offset, _offset * _multi, _delta * 20)

func _note_created(_note):
	if not is_3_player:
		return
	
	if not _note.must_hit:
		return
	
	var _note_type = "GF Sing"
	if play_state.is_odd_player:
		_note_type = ""
	
	if _note.note_value == _note_type:
		_note.queue_free()

func _note_hit_any(_note, _timing):
	if _note.note_value == "GF Sing":
		_note.button.get_parent().character = gf_character

func _on_beat(_beat):
	match int(_beat):
		3:
			tween(player_character, "scale:x", player_character.scale.x, -player_character.scale.x, 0.2)
		4:
			camera.position.x = (enemy_character.position.x + player_character.position.x) / 2
			camera.zoom = stage.return_zoom + Vector2(0.1, 0.1)
		7:
			tween(enemy_character, "position", enemy_character.position, enemy_start, 0.6)
		10:
			tween(gf_character, "position", gf_character.position, gf_start, 0.5)
		14:
			hud.modulate.a = 1

			stage.cam_unlocked = false
		16:
			hud.bop_mod = 2
		112:
			hud.bop_mod = 1
		176:
			hud.bop_mod = 2

func _on_step(_step):
	match int(_step):
		30:
			player_gun.visible = true
			player_gun.rotation_degrees = -90
		34:
			enemy_gun.visible = true
			enemy_gun.rotation_degrees = 90
