-- scaffold geniefile for filament

filament_script = path.getabsolute(path.getdirectory(_SCRIPT))
filament_root = path.join(filament_script, "filament")

filament_includedirs = {
	path.join(filament_script, "config"),
	filament_root,
}

filament_libdirs = {}
filament_links = {}
filament_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { filament_includedirs }
	end,

	_add_defines = function()
		defines { filament_defines }
	end,

	_add_libdirs = function()
		libdirs { filament_libdirs }
	end,

	_add_external_links = function()
		links { filament_links }
	end,

	_add_self_links = function()
		links { "filament" }
	end,

	_create_projects = function()

project "filament"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		filament_includedirs,
	}

	defines {}

	files {
		path.join(filament_script, "config", "**.h"),
		path.join(filament_root, "**.h"),
		path.join(filament_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
