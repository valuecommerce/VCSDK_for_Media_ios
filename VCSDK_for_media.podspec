Pod::Spec.new do |s|
  s.name             = 'VCSDK_for_media'
  s.version          = '1.0.7'
  s.summary          = 'ValueCommerce SDK for media.'



  #s.description      = <<-DESC TODO: Add long description of the pod here. DESC

  s.homepage         = 'https://www.valuecommerce.ne.jp/'
  s.license          = { :type => 'Copyright', :text => 'ValueCommerce' }
  s.author           = { 'miyazawa sunao' => 'smiyazawa@valuecommerce.co.jp' }
  s.source           = { :git => 'https://github.com/valuecommerce/VCSDK_for_Media_ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.preserve_paths = "VCSDK_for_media/VCSDK_for_Media_iOS.framework"
  s.source_files = 'VCSDK_for_media/VCSDK_for_Media_iOS.framework/Headers/*.h'
  s.public_header_files = "VCSDK_for_media/VCSDK_for_Media_iOS.framework/Headers/*.h"
  s.vendored_frameworks = "VCSDK_for_media/VCSDK_for_Media_iOS.framework"


end
