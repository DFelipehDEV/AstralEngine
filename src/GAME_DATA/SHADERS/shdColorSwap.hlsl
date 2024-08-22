SamplerState Sampler : register(s0);
SamplerState Palette : register(s1);
#define MAX_ITERATIONS 8
struct PS_INPUT {
    float4 position : POSITION0;
    float2 texcoord : TEXCOORD0;
    float4 color: COLOR;
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
    for (int i = 0; i < (int)u_texHeight; i++) {
        float4 originalColor = tex2D(Palette, float2(0.1,  i * stepSize));
        float4 newColor = tex2D(Palette, float2(0.5, (i / u_texHeight)));
        // Check if its the same color
        if (texColor.r == originalColor.r && texColor.g == originalColor.g && texColor.b == originalColor.b && texColor.a == 1) {
            output.color = newColor;
            return output;
        }
    }

    output.color = texColor;
    return output;
}