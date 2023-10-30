function onEvent(n, v1, v2)
	if (n == 'Set Property') then
		if (v1 == 'camOffset') then
			setProperty('timeBar.visible',true);
			setProperty('timeBarBG.visible',true);
			setProperty('timeTxt.visible',true );
		end
	end
end