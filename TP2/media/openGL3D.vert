#version 130

in vec3 position;
in vec4 color;

out vec4 fColor;

void main() {
  vec4 clipPosition=vec4(position,1);

  fColor=color;

  gl_Position=clipPosition;
}
