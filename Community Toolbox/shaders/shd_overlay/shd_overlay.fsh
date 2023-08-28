// Color Overlay Fragment Shader
// Source: https://manual.yoyogames.com/Additional_Information/Guide_To_Using_Shaders.htm
varying vec2 v_vTexcoord;
uniform vec4 u_color;
void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(u_color.rgb, texColor.a*u_color.a);
}
