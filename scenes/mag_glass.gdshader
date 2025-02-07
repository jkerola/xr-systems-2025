shader_type spatial;

uniform sampler2D screen_texture: hint_screen_texture;
render_mode unshaded, cull_disabled, blend_mix; 

varying vec2 object_center_uv;

void vertex() {
	UV = UV * 0.8 + 0.25;
	
	//calculate the node center uv
	vec4 p = PROJECTION_MATRIX * vec4(NODE_POSITION_VIEW,1.0);
	object_center_uv = (p.xy / p.w ) * 0.5 + 0.5;
}

vec2 scale_around_uv(vec2 uv, vec2 center, vec2 scale)
{
	return center + (uv - center) * (vec2(1.0) / scale);
}

void fragment() {
	float fishyness = 1.5;
	float scalyness = 2.0;
	vec2 scale_factor = vec2(1.0) * (1.0 - distance(SCREEN_UV,object_center_uv) * fishyness) * scalyness;
	ALBEDO = texture(screen_texture, scale_around_uv(SCREEN_UV, object_center_uv,scale_factor)).rgb;
}