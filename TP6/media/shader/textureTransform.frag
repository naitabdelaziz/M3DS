#version 130

uniform sampler2D image1;

in vec4 fTexCoord;

out vec4 fragColor;

void main() {
  vec4 texCoord=fTexCoord;
  texCoord.xy/=texCoord.w;
  texCoord.set(1-texCoord.x -((int)texCoord.x),
               1-texCoord.y -((int)texCoord.y),
               1-texCoord.z -((int)texCoord.z),
               texCoord.w);
  fragColor=texture(image1,texCoord.st);
}
