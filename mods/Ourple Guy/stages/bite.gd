extends FNFStage


var resource_folder = "/assets/stages/bite/"


onready var mod_folder = Resources.get_parent_directory(script_directory)
onready var assets_folder = mod_folder + resource_folder


onready var hud_parent = Node2D.new()

onready var webcam_container = Node2D.new()
onready var webcam = Control.new()
onready var hud_player_parent = Node2D.new()

onready var black_screen = ColorRect.new()
var load_sprite

var camera_sprite

var static_sprite

var screen1
var screen2
var screen3

var left_door
var left_door_button
var right_door
var right_door_button

var enemy_scale
var enemy_flip = true

var loaded = false
var screaming = false

var golden = false
var golden_timer = 0.0
var golden_timer_multi = 1

var webcam_bg


func _get_resources():
	return [
		resource_folder + "markbg.png",

		resource_folder + "load.png",
		resource_folder + "load.xml",

		resource_folder + "bitetitle.png",
		resource_folder + "static.png",
		resource_folder + "static.xml",

		resource_folder + "news.png",

		resource_folder + "12am.png",

		resource_folder + "bddown.png",
		resource_folder + "bdup.png",

		resource_folder + "stageback.png",
		resource_folder + "stagefront.png",
		
		resource_folder + "door.png",
		resource_folder + "button.png",

		resource_folder + "DJcamera.png",
		resource_folder + "DJcamera.xml",

        resource_folder + "gold_shader.gdshader"
	]


func _loaded():
    # setup
    clear_background()

    hud.countdown_sounds = []
    hud.do_hud_bop = false

    # funny player in webcam
    webcam_container.z_index = -1
    webcam_container.scale = Vector2.ONE / 1.5
    hud.add_child(webcam_container)

    webcam.rect_size = Vector2(550, 400)
    webcam.rect_position = Vector2((-webcam.rect_size.x / 2) - 690, (-webcam.rect_size.y / 2) - 340)
    webcam.rect_clip_content = true
    webcam_container.add_child(webcam)

    webcam_bg = new_sprite(assets_folder + "markbg.png")
    webcam_bg.centered = false
    webcam.add_child(webcam_bg)

    webcam.add_child(hud_player_parent)
    player_character.get_parent().remove_child(player_character)
    hud_player_parent.add_child(player_character)
    player_character.set_owner(hud_player_parent)

    player_character.position = Vector2(
        (webcam.rect_size.x / 2), 
        webcam.rect_size.y - 80
    )

    player_character.flip_x = !player_character.flip_x
    player_character.scale.x = -player_character.scale.x
    player_character.scale *= Vector2.ONE * 1.1

    # intro stuff
    hud_parent.z_index = 1
    hud.add_child(hud_parent)

    black_screen.color = Color.black
    black_screen.rect_size = Vector2(1280 * 2, 720 * 2)
    black_screen.rect_position -= black_screen.rect_size / 2
    hud_parent.add_child(black_screen)

    load_sprite = new_sprite_xml(assets_folder + "load")
    hud_parent.add_child(load_sprite)
    load_sprite.scale = Vector2.ONE / 2
    load_sprite.position = Vector2(-150 / 2, -150 / 2)
    load_sprite.add_by_prefix("load", "load load", [0, 0], 12, true)
    load_sprite.play("load")

    screen3 = new_sprite(assets_folder + "12am.png")
    screen3.visible = false
    hud_parent.add_child(screen3)

    screen2 = new_sprite(assets_folder + "news.png")
    screen2.scale /= Vector2(759.0 / 1280.0, 539.0 / 720.0)
    screen2.visible = false
    hud_parent.add_child(screen2)

    screen1 = new_sprite(assets_folder + "bitetitle.png")
    screen1.scale /= Vector2(1675.0 / 1280.0, 904.0 / 720.0)
    screen1.visible = false
    hud_parent.add_child(screen1)

    static_sprite = new_sprite_xml(assets_folder + "static")
    hud_parent.add_child(static_sprite)
    static_sprite.scale /= Vector2(1.30859375, 1.25555555556)
    static_sprite.scale *= 3.1
    static_sprite.position -= Vector2(550 * (static_sprite.scale.x / 2), 310 * (static_sprite.scale.y / 2))
    static_sprite.modulate.a = 0.3
    static_sprite.visible = false
    static_sprite.add_by_prefix("static", "static", [0, 0], 12, true)
    static_sprite.play("static")

    # camera
    camera_sprite = new_sprite_xml(assets_folder + "DJcamera")
    hud_parent.add_child(camera_sprite)
    camera_sprite.visible = false
    camera_sprite.position -= Vector2(800, 541.45)
    camera_sprite.scale = Vector2.ONE * 0.65
    camera_sprite.add_by_prefix("open", "CamFLIP", [0, 0], 24, false)
    camera_sprite.add_by_prefix("loop", "CamLOOP", [90, 0], 24, true)

    # the actual stage part
    stage.return_zoom = Vector2.ONE * 1.95
    camera.zoom = stage.return_zoom

    enemy_character.scale *= 1.5
    enemy_character.position = Vector2.ZERO

    enemy_scale = enemy_character.scale
    enemy_flip = enemy_character.flip_x

    enemy_character.visible = false

    gf_character.position = Vector2.ZERO
    gf_character.visible = false

    var _blackbg_container = Node2D.new()
    _blackbg_container.z_index = -20
    stage.add_child(_blackbg_container)

    var _blackbg = ColorRect.new()
    _blackbg.color = Color.black
    _blackbg.rect_size = Vector2(1280 * 2, 720 * 2)
    _blackbg.rect_position -= black_screen.rect_size / 2
    _blackbg_container.add_child(_blackbg)

    left_door = new_sprite(assets_folder + "door.png")
    left_door.scale *= 2
    left_door.z_index = -15
    stage.add_child(left_door)

    right_door = new_sprite(assets_folder + "door.png")
    right_door.scale *= 2
    right_door.flip_h = true
    right_door.z_index = -15
    stage.add_child(right_door)

    var _back = new_sprite(assets_folder + "stageback.png")
    _back.scale *= 2
    _back.z_index = -10
    stage.add_child(_back)

    var _front = new_sprite(assets_folder + "stagefront.png")
    _front.scale *= 2
    stage.add_child(_front)

    var _overup = new_sprite(assets_folder + "bdup.png")
    _overup.scale *= 2
    _overup.position.y = -430
    stage.add_child(_overup)

    var _overdown = new_sprite(assets_folder + "bddown.png")
    _overdown.scale *= 2
    _overdown.position.y = 100
    stage.add_child(_overdown)

    left_door_button = new_sprite(assets_folder + "button.png")
    left_door_button.scale *= 2
    left_door_button.position.x -= 1150
    stage.add_child(left_door_button)

    right_door_button = new_sprite(assets_folder + "button.png")
    right_door_button.scale *= 2
    right_door_button.position.x += 1150
    right_door_button.flip_h = true
    stage.add_child(right_door_button)

    play_state.hud_ratings = true
    
    hud.middlescroll = true
    hud.update_settings()

    door(false, true)
    door(false, false)

    #_on_end_intro()

    camera.position = Vector2.ZERO
    camera.reset_smoothing()

    loaded = true

func _process(_delta):
    if loaded:
        camera.position = Vector2.ZERO

        if screaming:
            var ashes = 20
            hud_player_parent.position = Vector2(rand_range(-ashes, ashes), rand_range(-ashes, ashes))
        else:
            hud_player_parent.position = Vector2.ZERO
        
        if golden:
            var ratio = enemy_character.sprite.texture.get_size() / enemy_character.sprite.region_rect.size
            var offset = enemy_character.sprite.region_rect.position / enemy_character.sprite.texture.get_size() * ratio
            enemy_character.sprite.material.set_shader_param("ratio", ratio)
            enemy_character.sprite.material.set_shader_param("offset", offset)

func _on_end_title():
	static_sprite.animation_player.stop(false)

	tween(static_sprite, "modulate:a", static_sprite.modulate.a, 0, 2.0)
	tween(screen1, "modulate:a", screen1.modulate.a, 0, 2.0)

	timer(5, "_on_end_news")

func _on_end_news():
	tween(screen2, "modulate:a", screen2.modulate.a, 0, 2.0)

	timer(4, "_on_end_intro")

func _on_end_intro():
	hud_parent.z_index = -2
	
	load_sprite.visible = false
	static_sprite.visible = false
	screen1.visible = false
	screen2.visible = false
	screen3.visible = false

	black_screen.visible = true
	black_screen.color = Color.white
	tween(black_screen, "modulate:a", 1.0, 0, 0.5)

	hud.do_hud_bop = true


func enemy_appear(right = true, speed = 1):
	var rot_multi = 1
	if right:
		rot_multi = -1
	
	var final_pos = Vector2(-950 * rot_multi, 330)

	enemy_character.visible = true
	enemy_character.position.y = 2000

	if right:
		enemy_character.flip_x = not enemy_flip
	else:
		enemy_character.flip_x = enemy_flip

	enemy_character.scale.x = enemy_scale.x * rot_multi

	tween(enemy_character, "rotation_degrees", -25 * rot_multi, 4 * rot_multi, speed, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	tween(enemy_character, "position", final_pos + Vector2(500 * -rot_multi, -10), final_pos, speed, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)

func enemy_bye(right = true, speed = 0.5):
	var rot_multi = 1
	if right:
		rot_multi = -1
	
	var final_pos = Vector2(-2050 * rot_multi, 320)
	tween(enemy_character, "position", enemy_character.position, final_pos, speed, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)


func open_camera():
	camera_sprite.visible = true
	camera_sprite.play("open")

	camera_sprite.animation_player.connect("animation_finished", self, "_on_cam_open_anim", [], CONNECT_ONESHOT)

func _on_cam_open_anim(_animation):
	camera_sprite.play("loop")


func golden_start():
    enemy_character.sprite.material = ShaderMaterial.new()
    enemy_character.sprite.material.shader = load(assets_folder + "gold_shader.gdshader")

    enemy_character.visible = true
    
    golden = true
    enemy_character.rotation_degrees = 0
    enemy_character.position = Vector2(0, 550) + enemy_character.position_offset

func golden_fade():
	var time = 1.5
	tween(enemy_character, "modulate:a", 1.0, 0.0, time)
	timer(time, "golden_gone")

func golden_gone():
    enemy_character.sprite.material = null

    golden = false
    enemy_character.modulate = Color.white
    enemy_character.modulate.a = 1.0

    enemy_character.position.y = 9000


func close_camera():
	camera_sprite.visible = true
	camera_sprite.animation_player.play_backwards("open")

	timer(0.6, "_on_cam_close_anim")

func _on_cam_close_anim():
	camera_sprite.visible = false


func door(close = false, right = true, speed = 0.4):
	var door = left_door
	var button = left_door_button
	if right:
		door = right_door
		button = right_door_button

	var oofset = 1000
	if close:
		tween(door, "offset:y", -oofset, 0, speed, Tween.TRANS_CUBIC, Tween.EASE_IN)
	else:
		tween(door, "offset:y", 0, -oofset, speed, Tween.TRANS_CUBIC, Tween.EASE_IN)

	button.visible = true
	timer(0.2, "turn_off_button", [button])

func turn_off_button(button):
	button.visible = false


func scream():
	screaming = true
	timer(0.5, "_on_scream_done")

func _on_scream_done():
	screaming = false


func webcam_switch(right = true):
	var new_pos = 0
	if right:
		new_pos = 930
	
	var speed = 1.0
	tween(webcam_container, "position:x", webcam_container.position.x, new_pos, speed, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	timer(speed / 2, "webcam_switch_side", [right])

func webcam_switch_side(right):
	if right:
		webcam_bg.flip_h = true

		player_character.flip_x = not player_character.flip_x
		player_character.scale.x *= -1
	else:
		webcam_bg.flip_h = false

		player_character.flip_x = not player_character.flip_x
		player_character.scale.x *= -1


func _on_beat(_beat):
	if load_sprite.visible:
		if _beat >= -3:
			hud_parent.z_index = -2

			black_screen.visible = false
			load_sprite.visible = false
			
			static_sprite.visible = true
			screen1.visible = true
			screen2.visible = true
			screen3.visible = true
			
			hud.get_node("CountdownSprite").visible = false

	if _beat == 0:
		timer(3, "_on_end_title")

func _on_step(_step):
    # event stuff

    if _step == 188:
        # freddy appear
        enemy_appear(true)

    if _step == 204:
        # credits
        pass

    if _step == 248:
        # scream
        scream()

    if _step == 736:
        # freddy leave and close right door
        door(true, true)
        enemy_bye(true)

    if _step == 752:
        # open right door
        door(false, true)

    if _step == 756:
        # bonnie appear
        webcam_switch(true)
        enemy_appear(false)
    if _step == 1168:
        # bonnie leave and close left door
        door(true, false)
        enemy_bye(false)

    if _step == 1248:
        # open left door
        door(false, false)

    if _step == 1264:
        # open cams
        open_camera()

    if _step == 1520:
        # close cams
        golden_start()
        close_camera()

    if _step == 1528:
        # scream
        scream()

    if _step == 2048:
        # golden freddy dies :(
        golden_fade()

    if _step == 2076:
        # foxy appear
        enemy_appear(false, 0.2)

    if _step == 2616:
        # scream and freddys back instant?
        # close left door instant
        scream()
        webcam_switch(false)
        door(true, false, 0.01)
        enemy_appear(true, 0.01)

    if _step == 3384:
        # scream
        scream()

    if _step == 3392:
        # close right door
        # both doors are closed now
        # fade to win
        door(true, true)
        enemy_bye(true)
