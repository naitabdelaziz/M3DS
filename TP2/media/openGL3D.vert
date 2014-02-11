#version 130

in vec3 position;
in vec4 color;

out vec4 fColor;

uniform mat4 projection;
uniform mat4 transform;

void main() {
  vec4 clipPosition=vec4(position,1);
  clipPosition=transform*clipPosition; 
  clipPosition=projection*clipPosition; // transformation par la matrice de projection
  fColor=color;

  gl_Position=clipPosition;
}
