shader_type canvas_item;

uniform vec2 direction = vec2(1.0, 0.0);
uniform float speed_scale = 0.3;

void fragment() {
    vec2 move = direction * TIME * speed_scale;
    vec2 uv = fract(UV + move);  // Use fract to keep UV coordinates in the range [0, 1]
    COLOR = texture(TEXTURE, uv);
}
