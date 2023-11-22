extends FNFScript


var icons = []


func register_character(character):
    var icon_node = "Player"
    var icon_other_node = "Enemy"
    if character == stage.enemy_character:
        icon_node = "Enemy"
        icon_other_node = "Player"

    var icon = hud.get_node("HealthBar/Icons/%s" % icon_node)
    icon.hframes = 3

    var other_icon = hud.get_node("HealthBar/Icons/%s" % icon_other_node)

    icons.append([character, icon, other_icon])

func _process(_delta):
    for data in icons:
        var icon = data[1]
        var other_icon = data[2]

        if other_icon.frame == 1:
            icon.frame = 2