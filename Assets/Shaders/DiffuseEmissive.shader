Shader "ShaderLab/DiffuseEmissive" 
{
    Properties 
    {
        _Texture ("Texture", 2D) = "white" {}
        _Emission ("Emission", 2D) = "white" {}
    }
    
    SubShader 
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input 
        {
            fixed2 uv_Texture;
        };
        
        sampler2D _Texture;
        sampler2D _Emission;
        
        void surf(Input IN, inout SurfaceOutput o) 
        {
            o.Albedo = tex2D(_Texture, IN.uv_Texture).rgb;
            o.Emission = tex2D(_Emission, IN.uv_Texture).rgb;
        }
        ENDCG
    }
    
    Fallback "Diffuse"
}