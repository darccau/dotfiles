// Ghostty cursor-warp fragment shader (placeholder).
//
// This file is referenced from the ghostty config via `custom-shader`.
// Replace the contents below with your own effect; ghostty recompiles the
// shader live when the config is reloaded (cmd+s>r).
//
// Reference uniforms available from ghostty:
//   vec2  u_resolution   (framebuffer size in pixels)
//   vec2  u_cursor       (texture coords of the cursor, 0..1)
//   float u_time         (seconds since shader load)
//   vec2  u_delta        (frame delta time)
//   vec4  u_scale        (gl_PrimitiveID-independent scale info)

precision highp float;
varying vec2 v_texcoord;

uniform sampler2D u_texture;
uniform vec2 u_resolution;
uniform vec2 u_cursor;
uniform float u_time;

void main() {
    vec2 uv = v_texcoord;
    vec2 delta = uv - u_cursor;

    // subtle pull toward the cursor so it stays visually anchored while typing
    float dist = length(delta) * 6.0;
    float warp = exp(-dist * dist) * 0.015;
    vec2 warped = uv - delta * warp;

    gl_FragColor = texture2D(u_texture, warped);
}
