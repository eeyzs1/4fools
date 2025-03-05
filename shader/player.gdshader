shader_type canvas_item;

uniform vec4 glow_color:source_color = vec4(0.02,0.01,0.01,0.05);
uniform float glow_power:hint_range(0.0, 100.0, 0.1) = 2.0;
uniform float glow_shift:hint_range(0.0, 10.0, 0.1) = 1.0;
uniform float glow_radius:hint_range(1.0, 10.0, 1.0) = 1.0;

void fragment() {
	vec4 glow = vec4(0.0);
	for(float x = -glow_radius;x <= glow_radius;x+=1.0){
		for(float y = -glow_radius;y <= glow_radius;y+=1.0){
			vec2 offset = vec2(x,y) * glow_shift * TEXTURE_PIXEL_SIZE;
			glow+=texture(TEXTURE,UV+offset);
		}
	}
	glow*=(glow_power*glow_color/(glow_radius*glow_radius*4.0));
	COLOR = mix(texture(TEXTURE,UV),glow,glow.a);
}
