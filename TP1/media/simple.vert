#version 130

in vec3 position;
in vec4 couleur;
in vec2 texCoord;

uniform float coeff;

out vec4 fColor;
        
void main() {
    fColor = couleur;
    vec3 newPosition = position*coeff;
    gl_Position=vec4(newPosition,1.0);

}
