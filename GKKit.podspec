Pod::Spec.new do |s|
  s.name         = "GKKit"
  s.version      = "0.1.5"
  s.summary      = "A Sample GKKit framework.so you can use it"
  s.description  = <<-DESC
                   this is GKKit framework, use it for test your framework. we can use it as framework.
		   DESC
  s.homepage     = "https://github.com/wongstar/GKKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "tao" => "wongstar.iac@gmail.com" } 
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/wongstar/GKKit.git", :tag => "#{s.version}" }
  s.source_files = 'GKKit/GKKit.h'
  s.public_header_files='GKKit/GKKit.h'
  s.resource     = 'GKKit/GKResource.bundle'

  s.subspec 'Classes' do |ss|
    ss.source_files= 'GKKit/**/*.{h,m}'
    #ss.public_header_files='GKKit/**/*.{h}
  end

  s.subspec 'MJRefreshResource' do |ss|
    ss.resource ='GKKit/ThirdPart/MJRefresh/MJRefresh.bundle'
  end

  s.requires_arc = true
  s.frameworks = 'UIKit','CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary'



end
