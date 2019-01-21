Shader "ShaderLab/TextureColored" 
{
    Properties 
    {
        _Texture ("Texture", 2D) = "white" {}
    }
    
    SubShader {
        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input 
        {
            float2 uv_Texture;
        };
        
        sampler2D _Texture;
        
        void surf(Input IN, inout SurfaceOutput o) 
        {
        float4 green = float4(0,1,0,1);
            float3 tex = (tex2D(_Texture, IN.uv_Texture) * green).rgb;
            
            o.Albedo = tex;
        }
        ENDCG
    }
    
    Fallback "Diffuse"
}