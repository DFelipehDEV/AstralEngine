SamplerState Sampler : register(s0);
SamplerState Palette;

#define MAX_ITERATIONS 16

struct PS_INPUT {
    float4 position : POSITION0;
    float2 texcoord : TEXCOORD0;
    float4 color : COLOR;
};

struct PS_OUTPUT {
    float4 color : COLOR;
};

uniform float u_texHeight;

PS_OUTPUT main(PS_INPUT input) {
    PS_OUTPUT output;

    float4 texColor = tex2D(Sampler, input.texcoord);
    float stepSize = 1.0 / u_texHeight;

    [unroll(MAX_ITERATIONS)]
    for (int i = 0; i < MAX_ITERATIONS; i++) {
        float paletteIndex = i * stepSize;
        float4 originalPaletteColor = tex2D(Palette, float2(0.1, paletteIndex));
        float4 newPaletteColor = tex2D(Palette, float2(0.5, paletteIndex));

        if (all(texColor == originalPaletteColor)) {
            output.color = newPaletteColor;
            return output;
        }
    }

    output.color = texColor;
    return output;
}