Shader "ShaderLab/StrippedRimLighting" 
{
    Properties 
    {
        _MainTex ("Diffuse Texture", 2D) = "white" {}
        _StripSize ("Strip Size", Range(0, 5)) = 1
        _Color1 ("Color 1", Color) = (1,1,1,1)
        _Color2 ("Color 2", Color) = (1,1,1,1)
    }
    
    SubShader 
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input 
        {
            float2 uv_MainTex;
            float3 worldPos;  
            float3 viewDir;
        };
        
        sampler2D _MainTex;
        float _StripSize;
        float4 _Color1;
        float4 _Color2; 
        
        void surf(Input IN, inout SurfaceOutput o) 
        {
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
            
            half rim = 1 - saturate(dot(IN.viewDir, o.Normal));
            
            half mod = frac(IN.worldPos.y * 5);
            o.Emission = mod > _StripSize ? _Color1.rgb * rim : _Color2.rgb * rim; 
        }
                
        ENDCG
    }

    Fallback "Diffuse"

}