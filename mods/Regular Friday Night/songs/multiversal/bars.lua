local enabled = true

if enabled and not lowQuality then
	local thickness = 100

	function onCreate()
		makeLuaSprite("bar_upper", nil, 0, -thickness)
		makeGraphic("bar_upper", 1280, thickness, "000000")
		setObjectCamera("bar_upper", "hud")
		addLuaSprite("bar_upper", false)

		makeLuaSprite("bar_lower", nil, 0, 720)
		makeGraphic("bar_lower", 1280, thickness, "000000")
		setObjectCamera("bar_lower", "hud")
		addLuaSprite("bar_lower", false)
	end

	function onSongStart()
		doTweenY("bar_upper", "bar_upper", -20, 2, "quintout")
		doTweenY("bar_lower", "bar_lower", 735 - thickness, 2, "quintout")
	end
end

-- crash prevention
function onUpdate() end
function onUpdatePost() end
