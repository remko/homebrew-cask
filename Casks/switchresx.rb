cask :v1 => 'switchresx' do
  version '4.5.2'
  sha256 '6861861ec9ed510965a9794cb009399095c7a091268cef08031b0caca5ac71a8'

  url "http://www.madrau.com/data/switchresx/SwitchResX#{version.to_i}.zip"
  name 'SwitchResX'
  homepage 'http://www.madrau.com'
  license :freemium

  prefpane 'SwitchResX.prefPane'

  uninstall :quit   => [
                        'fr.madrau.switchresx.app',
                        'fr.madrau.switchresx.daemon',  # note, daemon does not :quit cleanly
                       ],
            :signal => [
                        [ 'INT',  'fr.madrau.switchresx.daemon' ],
                        [ 'KILL', 'fr.madrau.switchresx.daemon' ],
                      ],
            :delete => [
                        '/Library/ScriptingAdditions/SwitchResX Extensions.osax',
                        '/Library/ScriptingAdditions/SwitchResX Menu.osax',
                       ]
end
