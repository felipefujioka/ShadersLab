# ShadersLab

This repository is a set of Unity ShaderLab experiments, that focus on making a tech demo for effects that can be achieved using shader code.

## What is a shader?
A shader is a piece of code that is ran by the graphic card before the shaded object is rendered. This code defines how each pixel or group of pixels should be rendered by the GPU depeding on the material, textures and external variables.

### Anatomy of a ShaderLab shader
`````
// definition of the shader
Shader "MyShader" {
    Properties {
        _MyTexture ("My Texture", 2D) = "white" { }
        // Place other properties like colors or vectors here as well
    }
    SubShader {
        // here goes your
        // - Surface Shader or
        // - Vertex and Fragment Shader or
        // - Fixed Function Shader
    }
    SubShader {
        // Place a simpler "fallback" version of the SubShader above
        // that can run on older graphics cards here
    }
}

`````
Shaders can receive external input from the game code, and read data from the object being rendered, such as the vertexes data.

This experiments focused on surface shaders, that basicaly runs the shader code for every pixel of the object and can use data from the mesh (vertex data) and from the environment (lighting, camera data etc).
