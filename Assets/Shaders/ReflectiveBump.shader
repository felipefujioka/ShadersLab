Shader "ShaderLab/ReflectiveBump" 
{
    Properties 
    {
        _NormalMap("Normal Map", 2D) = "white" {}
        _ReflectiveTexture("Reflective Texture", CUBE) = "white" {}
    }
    
    SubShader 
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input 
        {
            fixed2 uv_NormalMap;
            fixed2 uv_ReflectiveTexture;
            float3 worldRefl; INTERNAL_DATA
        };
        
        sampler2D _NormalMap;
        samplerCUBE _ReflectiveTexture;
        
        void surf(Input IN, inout SurfaceOutput o) 
        {
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
            o.Emission = texCUBE(_ReflectiveTexture, WorldReflectionVector(IN, o.Normal)).rgb;
        }
        
        ENDCG
    }
    
    Fallback "Diffuse"
}