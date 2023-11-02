shader_type canvas_item;


const vec2 line_start = vec2(0.0, 0.9);
const vec2 line_end = vec2(1.0, -0.1);
const float threshold = 0.05;

const vec2 line_start2 = vec2(0.0, 1.1);
const vec2 line_end2 = vec2(1.0, 0.1);
const float threshold2 = 0.02;

uniform vec2 ratio = vec2(0.0);
uniform vec2 offset = vec2(0.0);


float lineStuffs(vec2 uv, vec2 start, vec2 end) {
	vec2 fragment_position = uv * ratio - offset;
	
	// Calculate the vector from the start of the line to the fragment position
    vec2 line_to_fragment = fragment_position - start;

    // Calculate the vector from the start of the line to the end of the line
    vec2 line_direction = end - start;

    // Calculate the length of the line
    float line_length = length(line_direction);

    // Normalize the line direction vector
    vec2 normalized_line_direction = line_direction / line_length;

    // Calculate the projection of line_to_fragment onto the line direction
    float projection = dot(line_to_fragment, normalized_line_direction);

    // Calculate the closest point on the line to the fragment
    vec2 closest_point = start + normalized_line_direction * projection;
	
	return length(fragment_position - closest_point);
}

void fragment() {
	float distance1 = lineStuffs(UV, line_start, line_end);
	float distance2 = lineStuffs(UV, line_start2, line_end2);
	
	COLOR = texture(TEXTURE, UV);
	
	if (COLOR.r >= 0.5 || COLOR.g >= 0.5 || COLOR.b >= 0.5) {
		COLOR = vec4(244.0 / 255.0, 207.0 / 255.0, 0, COLOR.a);
		
		if (distance1 < threshold || distance2 < threshold2) {
	        COLOR = vec4(1.0, 1.0, 1.0, COLOR.a);
	    }
	} else {
		COLOR = vec4(118.0 / 255.0, 73.0 / 255.0, 0, COLOR.a);
	}
}