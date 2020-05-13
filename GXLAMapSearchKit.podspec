#
# Be sure to run `pod lib lint GXLAMapSearchKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GXLAMapSearchKit'
  s.version          = '0.1.0'
  s.summary          = 'GXLAMapSearchKit.'
  s.swift_version    =  '5'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
GXLAMapSearchKit 高德地图搜索
                       DESC

  s.homepage         = 'https://github.com/bpdnd/GXLAMapSearchKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'bpdnd' => '3438291751@qq.com' }
  s.source           = { :git => 'https://github.com/bpdnd/GXLAMapSearchKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'GXLAMapSearchKit/Vendors/*.framework/Headers/**.h',
  s.public_header_files = 'GXLAMapSearchKit/Vendors/*.framework/Headers/**.h'
  s.frameworks = 'UIKit', 'SystemConfiguration','CoreTelephony','Security','GLKit'
  s.libraries  = 'c++'
  
  s.vendored_frameworks =  'GXLAMapSearchKit/Vendors/*.framework'
  s.preserve_paths = 'GXLAMapSearchKit/Vendors/*.framework'
  s.pod_target_xcconfig = {
            'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapSearchKit/Vendors/*.framework/Headers',
            'LD_RUNPATH_SEARCH_PATHS' => '$(PODS_ROOT)/GXLAMapSearchKit/Vendors/',
            'OTHER_LDFLAGS' => '-ObjC'
  }
  
  s.prepare_command = <<-EOF
    # 创建Base Module
    rm -rf GXLAMapSearchKit/Vendors/AMapSearchKit.framework/Modules
    mkdir GXLAMapSearchKit/Vendors/AMapSearchKit.framework/Modules
    touch GXLAMapSearchKit/Vendors/AMapSearchKit.framework/Modules/module.modulemap
    cat <<-EOF > GXLAMapSearchKit/Vendors/AMapSearchKit.framework/Modules/module.modulemap
    framework module AMapSearchKit {
      umbrella header "AMapSearchKit.h"
      export *
    }
    \EOF
  EOF
  
  # s.resource_bundles = {
  #   'GXLAMapSearchKit' => ['GXLAMapSearchKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'GXLAMapFoundation'
  
end
