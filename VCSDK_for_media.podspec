Pod::Spec.new do |s|
  s.name             = 'VCSDK_for_media'
  s.version          = '1.0.0'
  s.summary          = 'ValueCommerce SDK for media.'



  #s.description      = <<-DESC TODO: Add long description of the pod here. DESC

  s.homepage         = 'https://www.valuecommerce.ne.jp/'
  s.license          = { :type => 'Copyright', :text => 'ValueCommerce' }
  s.author           = { 'miyazawa sunao' => 'smiyazawa@valuecommerce.co.jp' }
  s.source           = { :git => 'https://github.com/valuecommerce/VCSDK_for_media.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.xcconfig = { 'SWIFT_OBJC_BRIDGING_HEADER' => '${PODS_ROOT}/../../VCSDK_for_media/BridgingHeader/VCSDK-Bridging-Header.h' }

  s.preserve_paths = "VCSDK_for_media/VCSDK.framework"
  s.source_files = 'VCSDK_for_media/VCSDK.framework/Headers/*.h'
  s.public_header_files = "VCSDK_for_media/VCSDK.framework/Headers/*.h"
  s.vendored_frameworks = "VCSDK_for_media/VCSDK.framework"

end
