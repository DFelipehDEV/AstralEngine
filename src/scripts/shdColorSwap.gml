/*
    ColorSwap
*/

return shader_pixel_create_base64("
    eJzlWLtuG0cUPTuzSy4lSkO9H6QUlkkjRAoCREVg0W5cOIAThYA72XGYWIAMCbIC
    uBx2KVPkA2ggFdP4D5I2gNPkC1LwO7LBnbkzO7uiRMlhEUACCOy5PHtm5twzK+5E
    Isv+yT7Dg68791sAfgUQiSyTAAgjAn4B8ASAREQQT6kO4MzUiCLwmms/AhD2NvzM
    tcfPTnoXFz3EqBsF+o7+Dp+9PDvpnV+q/3B00Xv9sHf8/YsLP6r77uzV0d7RN/ji
    +Pn56avT7y7aH371Ufvho8NH7cMXz77tnbcfnL48Oz7pnbf3d/b2d/Y/3dv5ZHd3
    F18CSQQ1+PPdu8+R/92juoAaWKjvATgA9G9Ul6ZOtQOq0cfwY18fHAC/+3ri638f
    AOi4esXXGx2g7etVX/+4Axz4eurrjzvAU1+v+fpZxy2A6jM8f14brQEf2DZoQL7l
    65+QqoG7jlI1uG/apzQweot0NIgAEUHqCE1zLcz1aFABhESkAZi6REXPwPJjRFqi
    q+210BIw1wmklvhLJ4CsMEegO7DY8gSGBleZK/CHwSnzJcDY8iXfX2O+xMjgGc/P
    GDu+1Z/1/KbBdebHrF9nfsz6c8yPWX/e863+vOdbfeX5Vr/B/IT1G8xPWH/Be2P1
    Fz3f6i96vtVf8nyrv8z8CusvM7/C+ivMr7D+qudb/VXPt/prnm/115lfZf115ldZ
    f4P5Vdbf9Hyrv+n5Vr/p+Va/xfyU9VvMT1l/i/kp6297vtXf9vyhyXAERTnVUToy
    WEBpEeAYinrpcQJF3ntcgSKvPK5C0do8TqFoLh7XoHQtwDNQtB88noXSswGuQ+l6
    gOeg9FyA56H0fIAVlFYBbkDpRoAXoPRCgBeh9GKAl6D0UoCXofRygFeg9EqAV6H0
    aoDXoPRagNeh9HqAN6D0RoA3ofRmgJtQuhngFpRuBXgLSm8FeBtKbzMW3D9gRD3s
    J0E/6fMEiBn3BTCgZ0oNkBKp54Qa8S00BKICh3IjgL7JCtcoaxJZn3Dsteg+9EmH
    9FzN8kzNzCnmOVV4Ti6XTodxaU7iEkeg2zf59OMLUyuOH5vxXc16QvMc0lxK87bj
    UY18DO4rrNnsIfbXrSW91VqiMWtB3+yla70Ubk6a/TS+SGS07pIH+VoCDwy3tD7z
    /yi/d3jtmM4HGsP1PvRh5lY+pGN8yPqzBR8oz3n/cm98n83/VvbL+EDzSYIeE+b1
    +p7n6y/23Ok6n0g3KWUjHz/MkJjYr0ne1W/lXTzGu2F/ruBdPKaf+RoFMvbOeFzy
    jnwzfpnvrXdZqSehJ0Vd52fZu9xj+l2Sexzu0dxjM0bJO4z1bn4KzxJ1g2dJ3uMh
    excXckbeWa9Mjb+3uNiT4v4MdZ2f471Dv9iLq7wb3ti7xhT27MLEPRvuD/Ob0PSB
    M1fyzuaQn0cTnm1FXefn9d4NJ3jXvbF3i1PYs0s32rO4Ys+WvXN71nmb3dK7/5q7
    m3u3PIXcrUzM3fvsWefd8H+bu9Up5G7tjuZufQq527ijuducQu6adzR3rSnkbuuO
    5m77PXNn73HnKPbcxa6/q2t87pLwOUqNz10k82sYf25C5yTyinOUMOfxFHIup5hz
    OfY9ppzzcE7ld4as1Kv8/d/O1fYq4V5J9ok+NhsGl84rogKHvKN5mnMofx9xynMy
    v6uvyLn1SlofbpLzNwLdN3mNdLNCzuUlj/P3k+Jv+8vvgG7Mq94B83vduyedqfpa
    6axi3PtDvpfcXOg8m+ZC/TBngnTendr+ZBnwL/STwaw=
")

/*
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

*/
