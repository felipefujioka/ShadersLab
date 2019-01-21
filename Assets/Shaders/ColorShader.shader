Shader "ShaderLab/ColorShader" 
{
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _Emission ("Emission", Color) = (1,1,1,1)
        _Normal ("Normal", Color) = (1,1,1,1)
    }
    
    Subshader {
    CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input 
        {
            float2 uvMainTex;
        };
        
        float4 _Color;
        float4 _Emission;
        float4 _Normal;
        
        void surf(Input IN, inout SurfaceOutput o) 
        {
            o.Albedo = _Color.rgb;
            o.Emission = _Emission.rgb;
            o.Normal = _Normal.rgb;
        }
        
    ENDCG
    }
    
    Fallback "Diffuse"
}