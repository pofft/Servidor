#include "mta-helper.fx"
#define GENERATE_NORMALS 

texture newTexture;
float size = 1;
float offset = 0;

sampler TextureSampler = sampler_state
{
    Texture = <newTexture>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = WRAP;
    AddressV = WRAP;
};



struct VertexShaderInput
{
    float3 Position		: POSITION;
	float4 Diffuse 		: COLOR0;
	float3 Normal 		: NORMAL0;
    float2 TexCoords	: TEXCOORD0;
};


struct VertexShaderOutput
{
	float4 Position		: POSITION;
	float4 Diffuse 		: COLOR0;
	float2 TexCoords	: TEXCOORD0;
	float3 worldNormal 	: TEXCOORD1;
};


VertexShaderOutput VertexShaderFunction(VertexShaderInput input)
{
    VertexShaderOutput output;
	
	MTAFixUpNormal(input.Normal);
		
	float3 newPosition = input.Position * size;
	newPosition.z += offset;
	
	output.Position = MTACalcScreenPosition(newPosition);
    output.TexCoords = input.TexCoords;
	output.worldNormal = MTACalcWorldNormal(input.Normal);
	output.Diffuse = MTACalcGTACompleteDiffuse(output.worldNormal, input.Diffuse);

    return output;
}


float4 PixelShaderFunction(VertexShaderOutput input) : COLOR0
{
	float4 finalColor = tex2D(TextureSampler, input.TexCoords) * input.Diffuse;
	
    return finalColor;
}
 
technique TexReplace
{
    pass Pass0
    {
		AlphaBlendEnable = true;
        AlphaRef = 1;
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}


// Fallback
technique fallback
{
    pass P0
    {
        // Just draw normally
    }
}