/// @desc Set up camera
cam = view_camera[0]
follow = oPlayer;
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;
