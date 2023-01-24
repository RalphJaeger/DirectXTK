project "DirectXTK"
	kind "StaticLib"
	language "C++"
    staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"Inc/*.h",
		"Inc/*.inc",
		"Src/*.cpp"
	}
	removefiles { "Src/XboxDDSTextureLoader.cpp", "Inc/XboxDDSTextureLoader.h" }
	
	includedirs
	{
		"Inc",
		"Src/Shaders/Compiled"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"