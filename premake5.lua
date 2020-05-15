workspace "premake_test"
   architecture "x64"
    configurations { 
       "Debug", 
       "Release"
   }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    
project "ProjectA"
   location "ProjectA"
   kind "StaticLib"
   language "C++"
   targetdir ""

   targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

   files {
      "%{prj.name}/src/**.cpp",
      "%{prj.name}/ProjectA.h",
      "%{prj.name}/src/**.h"
   }

   includedirs {
      "%{prj.name}/src",
      "%{prj.name}/vendor/spdlog/include"
   }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"
   
   filter "system:macosx"
      systemversion "latest"

project "ProjectB"
   location "ProjectB"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++17"

   targetdir ("bin/" .. outputdir .. "/%{prj.name}")
   objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

   files {
      "%{prj.name}/src/**.cpp",
      "%{prj.name}/src/**.h"
   }

   includedirs {
      "ProjectA",
      "ProjectA/vendor/spdlog/include"
   }

   links {
      "ProjectA"
   }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "system:macosx"
      systemversion "latest"
