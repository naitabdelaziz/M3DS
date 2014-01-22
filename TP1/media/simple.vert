#version 130

in vec3 position;
in vec4 couleur;

out vec4 fColor;
        
void main() {
    fColor = couleur;
    gl_Position=vec4(position,1.0);
}
