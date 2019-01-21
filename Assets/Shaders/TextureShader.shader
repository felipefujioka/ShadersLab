Shader "ShaderLab/Texture" 
{
    Properties 
    {
        _Multiplier ("Multiplier", Range(0,5)) = 1
        _Color ("Color", Color) = (1,1,1,1)
        _Texture ("Texture", 2D) = "white" {}
    }
    
    SubShader 
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        float4 _Color;
        sampler2D _Texture;
        float _Multiplier;
        
        struct Input 
        {
            fixed2 uv_Texture;
        };
        
        void surf(Input IN, inout SurfaceOutput o) 
        {
            o.Albedo = (tex2D(_Texture, IN.uv_Texture) * _Color * _Multiplier).rgb;
        }
        ENDCG
    }
    
    Fallback "Diffuse"
}