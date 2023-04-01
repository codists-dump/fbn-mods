extends FNFScript

func _process(_delta):
    if play_state.player_strum is Node:
        for _button in play_state.player_strum.get_children():
            var _notes_node = _button.get_node("Notes")

            for _note in _notes_node.get_children():
                _note.rotation_degrees += 10 * _delta