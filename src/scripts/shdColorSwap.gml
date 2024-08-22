/*
    shdColorSwap
*/

return shader_pixel_create_base64("
    eJyFV01vHEUQffOx6/F4PDMSxyDhI1wsJQiJHKKY5JJDkAAzUm4hwEIiJbLlGCnH
    3htHDvyAtcRpuOQfwDVSuOQXcPDvYNCrqu7pGa/BUsvzaqqrq9+rrulN0mH4Z/gU
    97/+7N77AH4HkKTDkAEgRgL8BuARgAwJEizxDe0ATsVGlxSvzPYzgFSn4VezffHk
    +er8fIUclUTgO/4dP3lx+nx1dsX+0+Pz1asHq2c/Pj0Pq/p3py8f33r8LT5/9t3Z
    ycuTH84PPvzqo4MHD48fHhw/ffL96uzg/smL02fPV2cHtw9v3T68/cmtw49v3ryJ
    L4FFgmajUdzdv96+vQO4P2hP1X6Xb9SOI9ozsf99RH/9D4mTi502HAFH8p72hdrN
    n/83EmcZ/DdHwJ/y/gOlyQHZa3v+BUWz8c9J0WzuCb2NAy5fo7jcJECaIHMp9DlF
    5hK82yyBNEPiAIg9w9KleCPPORKXoXP6nLoMkOcFMpfhnVsA2dJ8cmCjWP1ydIJ3
    zDfHpeAi+A+GvX8veDf43xBcmv/C4pXmvzD/vZDLG8GV+S8tn8r8lzZ/3/yXlk8d
    /DWfOvhr/Cb4az6t+WcWrzX/zPwz88/wRjRI0LgEly4pLgWnaKhBwDkachPwAo1b
    RHiJhrkGvIPG7US4QOOKCO+icbsRLtG4MsJ7aNxehCs0rorwPhq3H+Eajasj3KBx
    TYQzNC6LcIvGtYbfkzorpLYeAXmOwqUY1onUWrdJhQ+1+fpbomCNBX/alxhYLy7y
    D1h9epeiXy8M59F7xgMGl5i+xIzHwTUMr5lPvG6OYU0f2hinkDidS9GtiUvNjWvI
    usQlBhla14UrMMjwMQsMa+YVr1PObEXEEe1T3rpgKy1enHdpeZdR3pXxkxs/xBUG
    GZxjeLLX2vaa215b22tueyVuMcjQM1O4GoMMH7PGsOYaPjfa2pmNtc61eT5Y896v
    tH3R1+dcRjlzXhnN8zl7jjwXzCcBLuhLG8+icjOdR36Wxs98L4Yn/Cgf7BnKT6r9
    kz1HYhCnWhtuzpePSS4sP8lX88fExn1ybebLM+/XLowLr2++RU9/xiJOneeUNstp
    4leYXxHlel2dVVGdaY1e1aQ1TVIM4uN5mGuitkvpgyOfvSvQG7+p8F0EvnPhu9jC
    N2MaDpqpT84eIUNxyrMsY5wj8cOe1CY5TPbJ2MyXfdZr52uW+sX9gNjXGXmlzfeP
    yrDntJzpQZty023K2dma60s/Xxc+p2qmm88zrrE8qrF8phu/yXPd6v/UjTr1rrSz
    dJVjwZOzpFp2rjRteeegtqVpS5xr73FzHceY1KiLdEulV8U21a2TffL75/XVvcu3
    KPQyPnvd6FPNdCy39IdYjzrSzfv5mtymm53lcC7nurW2hmkQ9qPnd3puqNtiUr9S
    uxdtpJva4nnUoHdV0G3OseCJbqpT56qgG7WHq4JumcTn8DFUkz7SibZuYlOdetkX
    7yFezzboxLugr9FO+PO1Rx499n28/R+dlItRJ4s78VMb9zbGI7c+p7hfcI3r+kV8
    TlQn7Yv+nFAn+o460TbOU857V1tfVM47VwcNtC/WW86O5iJ40hc5J9f7gfDKmLl+
    +6M53Tqf7Im2fmLjt4qxmS/vh2PdwHTzfVd6qu/XUmumWahhO2vXnhvr1aLb6Kc1
    elU3XyNjv7iqG/mf9otF1C/890zX4F2gn9xds6ierZYvOHfUkbYxTo7aATdcixvr
    7ZwLnuk03mvnuo1zqEnc82gbJjbe1xmb+fDe7vXUvfJ+6fus1iSxrz3lkf08/uZ2
    c50uEnQX0fdT7t5p0El781RP6eEh/sil5jT9HnPNsV9wP/58+f2YTlvOk+ow+umd
    S/cte43WiHO5rgZZx8KH+PH3Nv3A3z8ykKKQ3+BuGIB/AVEaUIY=
")

/*
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

*/
