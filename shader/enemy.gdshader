shader_type canvas_item;

uniform vec4 expected_color : source_color = vec4(0,0,0,1);


void fragment() {
	COLOR = vec4(255,0,0,255);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
