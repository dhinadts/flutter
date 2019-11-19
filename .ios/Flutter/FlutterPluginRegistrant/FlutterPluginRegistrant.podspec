#
# Generated file, do not edit.
#

Pod::Spec.new do |s|
  s.name             = 'FlutterPluginRegistrant'
  s.version          = '0.0.1'
  s.summary          = 'Registers plugins with your flutter app'
  s.description      = <<-DESC
Depends on all your plugins, and provides a function to register them.
                       DESC
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'BSD' }
  s.author           = { 'Flutter Dev Team' => 'flutter-dev@googlegroups.com' }
  s.ios.deployment_target = '8.0'
  s.source_files =  "Classes", "Classes/**/*.{h,m}"
  s.source           = { :path => '.' }
  s.public_header_files = './Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'clipboard_manager'
  s.dependency 'connectivity'
  s.dependency 'device_info'
  s.dependency 'esys_flutter_share'
  s.dependency 'flutter_webview_plugin'
  s.dependency 'fluttertoast'
  s.dependency 'launch_review'
  s.dependency 'open_appstore'
  s.dependency 'package_info'
  s.dependency 'path_provider'
  s.dependency 'share'
  s.dependency 'shared_preferences'
  s.dependency 'sqflite'
  s.dependency 'url_launcher'
  s.dependency 'webview_flutter'
end
