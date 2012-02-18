Setup.Package
{
 	vendor = "liflg.org",
 	id = "simcity3000",
 	description = "Sim City 3000 Unlimited",
 	version = "2.0a-multilingual",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg",
 	},

	Setup.Media
 	{
 		id = "sc3000-disc",
		description = "Sim City 3000 Unlimited Loki Disc",
		uniquefile = "bin/x86/glibc-2.1/sc3bat"	
 	},

	Setup.Option 
	{
		required = true,
		description = "Files for Sim City 3000 Unlimited",
		bytes = 547921102, 

                Setup.DesktopMenuItem
		{
                	disabled = false,
			name = "Sim City 3000 Unlimited",
                        genericname = "Sim City 3000 Unlimited",
                        tooltip = "Play Sim City 3000 Unlimited",
                        builtin_icon = false,
                        icon = "icon.xpm",
                        commandline = "%0/sc3u.sh",
                        category = "Game",
                },

		Setup.File 
		{
			allowoverwrite = true,
			wildcards = {"README.liflg", "sc3u.sh"},
			filter = function(dest)
				if ( string.match( dest, "sc3u.sh") ) then
					return dest, "0755"
				end
				return dest
			end   
		},
	
		Setup.File 
		{
			source = "media://sc3000-disc/",
			wildcards = {"buildings/*", "cities/*", "res/*", "plugin/*", "Credits", "README", "hotkeys.txt", "icon.xpm", "sc3u.ini", "snapshot.ini"},
			filter = function(dest)
				if ( string.match( dest, "res/text/*" ) ) then
					return nil
				end
				if ( string.match( dest, "res/ba/*" ) ) then
					return nil
				end
				if( string.match( dest, "res/ui/shared/movies/intro.mpg" ) ) then
					return nil
				end
				return dest
			end
		},
		Setup.File
		{
			permissions = "0755",
			source = "media://sc3000-disc/bin/x86/glibc-2.1/",
		},

		Setup.OptionGroup
		{
			description = "Choose language and keymap",
			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "English (US)",
				Setup.File 
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/english/*",
				},

				Setup.File 
				{
					source = "media://sc3000-disc/sys/us/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},
			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "English (UK)",
				Setup.File 
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/english-uk/*",
				},

				Setup.File 
				{
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},

			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "German",
				Setup.File
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/german/*",
				},

				Setup.File
				{
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},

			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "French",
				Setup.File 
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/french/*",
				},

				Setup.File {
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},

			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "Italian",
				Setup.File 
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/italian/*",
				},

				Setup.File {
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},

			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "Spanish",
				Setup.File
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/spanish/*",
				},

				Setup.File 
				{
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
				Setup.File
				{
					allowoverwrite = true,
					source = "base:///spanish-patch-2.0a.tar/",
				},
			},

			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "Dutch",
				Setup.File
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/dutch/*",
				},

				Setup.File 
				{
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},

			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "Swedish",
				Setup.File
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/swedish/*",
				},
				Setup.File
				{
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},
			Setup.Option
			{
				value = true,
				bytes = 2000000,
				description = "Portuguese",
				Setup.File
				{
					source = "media://sc3000-disc/",
					wildcards = "res/text/portuguese/*",
				},

				Setup.File
				{
					source = "media://sc3000-disc/sys/eu/",
					destination = "sys/",
					wildcards = "sys.pak",
				},
			},
		},
		Setup.Option 
		{
			value = true,
			description = "Install intro movie",
			tooltip = "Unselect if it causes trouble and remove CD-ROM while playing",	
			bytes = 19355702,
			Setup.File 
			{
				source = "media://sc3000-disc/",
				wildcards = "res/ui/shared/movies/intro.mpg",
			},
		},
			
		Setup.Option 
		{
			value = true,
			description = "Install Loki-Compat libs",
			tooltip = "Allows Sim City 3000 to run under new distributions",
			bytes = 6654249,
			Setup.File
			{
				allowoverwrite = true,
				source = "base:///loki_compat_libs-1_3.tar.bz2/",
			},
		},

		Setup.Option 
		{
			value = true,
			required = true,
			description = "Apply Patch 2.0a",
			tooltip = "Latest update from Loki",
			bytes = 41000960,
			Setup.File
			{
				allowoverwrite = true,
				source = "base:///patch-2.0a.tar/",
			},

			Setup.File 
			{
				allowoverwrite = true,
				wildcards = "sc3u.dynamic.sh",
				permissions = "755",   
			},
		},

		Setup.Option 
		{
			value = true,
			description = "Building Architect Plus",
			tooltip = "Design your own houses",
			bytes = 39208034,
	                Setup.DesktopMenuItem
			{
               			disabled = false,
				name = "Sim City 3000 Building Architect Plus",
				genericname = "Sim City 3000 Building Architect Plus",
				tooltip = "Play Sim City 3000 Unlimited Building Architect Plus ",
				builtin_icon = false,
				icon = "icon.xpm",
				commandline = "%0/sc3bat.sh",
				category = "Game",
			},
			
			Setup.File 
			{
				allowoverwrite = true,
				wildcards = {"sc3bat.sh", "sc3bat.dynamic.sh"},
				permissions = "0755",
			},

			Setup.File 
			{
				allowoverwrite = true, 
				source = "media://sc3000-disc/",
				wildcards = {"barender/*", "bacustom/*", "res/ba/*"},
			},
		},
	},
}		

