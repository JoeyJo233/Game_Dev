shader_type canvas_item;

uniform float cutoff: hint_range(0.0, 1.0) = 0.5;
uniform float feather: hint_range(0.0, 1.0) = 0.1;
uniform sampler2D mask;

//void vertex() {
	//// Called for every vertex the material is visible on.
//}

void fragment() {
	vec4 col =  vec4(0.0, 0.0, 0.0, 1.0);
	//if(UV.x < cutoff){
		//col.a = 0.0;
	//}
	col.a = smoothstep(cutoff - feather, cutoff, UV.x * (1.0 - feather));
	COLOR = col;
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
