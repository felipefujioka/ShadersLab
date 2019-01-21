Shader "ShaderLab/MetallicCuttout" 
{
    Properties 
    {
        _MainTex ("Main Texture", 2D) = "white" {}
        _MetallicCuttout ("MetallicCutout", 2D) = "white" {}
        _Metallic ("Metallic", Range(0, 1)) = 0
        _Emission ("Emission", Range(0, 1)) = 0
    }
    
    SubShader 
    {
        CGPROGRAM
        
        #pragma surface surf Standard
        
        struct Input 
        {
            float2 uv_MainTex;
            float2 uv_MetallicCuttout;
        };
        
        fixed _Metallic;
        fixed _Emission;
        sampler2D _MainTex;
        sampler2D _MetallicCuttout;
        
        void surf(Input IN, inout SurfaceOutputStandard o) 
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            o.Smoothness = tex2D(_MetallicCuttout, IN.uv_MetallicCuttout).r;
            o.Metallic = _Metallic;
            o.Emission = _Emission;
        }
        
        ENDCG
    }
    
    Fallback "Diffuse"
}