fx_version "cerulean"

description "Basic React (TypeScript) & Lua Game Scripts Boilerplate"
author "Project Error"
version '1.0.0'
repository 'https://github.com/project-error/fivem-react-boilerplate-lua'

lua54 'yes'

games {
  "gta5",
  "rdr3"
}

ui_page 'ui/index.html'

client_scripts {
	"@vrp/lib/utils.lua",
	'client.lua'
}

server_scripts {
  '@vrp/lib/utils.lua',
  'fpt.lua'
}

files {
  'ui/index.html',
  'ui/**/*',
  'mp_f_freemode_01_mp_f_fplaytaddonc.meta',
	'mp_m_freemode_01_mp_m_fplaytaddonc.meta',
	'mp_f_freemode_01_mp_f_hainemafii.meta',
	'mp_m_freemode_01_mp_m_hainemafii.meta',
}

data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'

files {
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta'
}

client_script {
    "gabz_mrpd_entitysets.lua"
}

-----------------------------------------------------------------------
-- Haine
-----------------------------------------------------------------------
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_f_freemode_01_mp_f_fplaytaddonc.meta'
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_m_freemode_01_mp_m_fplaytaddonc.meta'
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_m_freemode_01_mp_f_hainemafii.meta'
data_file 'SHOP_PED_APPAREL_META_FILE' 'mp_m_freemode_01_mp_m_hainemafii.meta'