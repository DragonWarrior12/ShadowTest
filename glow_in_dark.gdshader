shader_type canvas_item;
render_mode light_only;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
uniform vec4 on_light_color : source_color;

float squish(float a){
	return 1.25 - (1.25 / (4.0 * a + 1.0));
}

void light(){
	vec4 light_colour = LIGHT_COLOR;// - vec4(0.4, 0.4, 0.4, 0.0);
	//float alpha = max(light_colour.r, max(light_colour.g, light_colour.b));
	//float alpha = 0.2126 * light_colour.r + 0.7152 * light_colour.g + 0.0722 * light_colour.b;
    LIGHT = vec4(mix(texture(SCREEN_TEXTURE, SCREEN_UV).rgb, light_colour.rgb, (light_colour.a)), squish(light_colour.a));
	//LIGHT = vec4(LIGHT_COLOR.rgb * texture(SCREEN_TEXTURE, SCREEN_UV).rgb * LIGHT_ENERGY,sqrt(alpha));
}