/*
    shdHeat
*/

return shader_pixel_create_base64("
    eJxVkb9LI1EQxz/v7UbD/WALW8FFOTgtAoncQbjDH0mjoIUXA3a5qHsaMCZs1v6J
    jXb2Ng/LbJNGbURsr7vOwjb/hI3veG+DmKlmPt+Z78CMkMa8mu9Ut1cr08A1IKQx
    HmBrBFwBO4BlAslvy4EuILMW1IhdOibGWK3Z7h5FMT6fnGI1GyeNvZM4jo6TpNWO
    SFO7YVzvJXF0fHCY0O01So1dNlt7cafX+ZOEX3/Nh2sbtY2wdtjcj+Kw2ml3W0dR
    HJYLpXKh/K1UWCwWi6RbkJME+uxldglYfg7+rjwH64+WewT6w9PcT96F5T6BFp//
    3TQ/3t6l/YUfF+fnZctzBDrt9++BB1DL1m8mO4ECbzDKL8kHWrg8rwRoH3wQCuoD
    MPYs7xhKgpbU9ZSbydi43tcSo7+AL5AjfahzDN98BHXlgQYG2W7bVx9U3NsCBUNF
    fqgnQArna1QOPMGk0wSoHedla3OaMccl+WzeGPgPNKlqxA==
")

/*
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

*/
