if (ctrl_UiManager.keyboard_focus == id)
	image_blend = c_white;
else if (position_meeting(mouse_x, mouse_y, id))
	image_blend = c_silver;
else
	image_blend = c_gray;
