Pod::Spec.new do |s|
  s.name     = 'ZTCore'
  s.version  = '1.0.6'
  s.license  = { :type => "MIT", :file => "FILE_LICENSE" }
  s.summary  = 'Core'
  s.homepage = 'https://gitlab.com/zt/ztcore'
  #s.social_media_url = 'https://xx'
  s.authors  = { 'mapengzhen' => 'mpz129@sina.com' }
  s.source   = { :git => 'https://gitlab.com/zt/ZTCore.git', :tag => s.version }
  s.requires_arc = true

  s.ios.deployment_target = '6.0'

  s.public_header_files = 'ZTCore/**/*.h'
  s.source_files =  "ZTCore", "ZTCore/**/*.{h,m}"
  s.resources = ["ZTCore/**/*.png", "ZTCore/**/*.{xib,storyboard,xcdatamodeld,xcdatamodel,txt,plist,cer,html}"]

  s.frameworks = 'CoreGraphics', 'Foundation', 'UIKit'
end
