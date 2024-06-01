shader_type canvas_item;

uniform bool isEnable = false;

void fragment( )
{
	vec4 pixelColor = texture(TEXTURE, UV);
	if (isEnable) {
		pixelColor.rgba = vec4(1.0, 1.0, 1.0, pixelColor.a);
	}
	COLOR = pixelColor;
}
