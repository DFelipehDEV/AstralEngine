SamplerState Sampler: register(s0);

struct PS_INPUT {
    float4 position: POSITION0;
    float2 texcoord: TEXCOORD0;
    float4 color: COLOR;
};

struct PS_OUTPUT {
    float4 color: COLOR;
};

uniform float u_currenttime;
uniform float u_strenght;

PS_OUTPUT main(PS_INPUT input) {
    PS_OUTPUT output;
    float wave = sin(((input.texcoord.y * u_strenght) + u_currenttime)) * 0.01;

    float2 distortedPos = float2(input.texcoord.x + wave, input.texcoord.y);
    float4 distortedColor = tex2D(Sampler, distortedPos);
    if (distortedColor.w > 0.0)
    {
        distortedColor.xyz /= distortedColor.w;
    }
    output.color = distortedColor;
    return output;
}
