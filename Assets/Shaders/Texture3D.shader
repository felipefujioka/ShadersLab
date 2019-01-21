Shader "ShaderLab/3DTexture" 
{
    Properties 
    {
        _Texture ("Texture", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _BumpAmount ("Bump Amount", Range(0, 10)) = 1
        _Brightness ("Brightness", Range (0, 10)) = 1
    }
    
    SubShader 
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input 
        {
            fixed2 uv_Texture;
            fixed2 uv_NormalMap;
        };
        
        sampler2D _Texture;
        sampler2D _NormalMap;
        
        fixed _BumpAmount;
        fixed _Brightness;
        
        void surf(Input IN, inout SurfaceOutput o) 
        {
            o.Albedo = tex2D(_Texture, IN.uv_Texture).rgb;
            o.Normal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap)) * _Brightness;
            o.Normal *= fixed3(_BumpAmount, _BumpAmount, 1);
        }
        
        ENDCG
    }
    
    Fallback "Diffuse"
}