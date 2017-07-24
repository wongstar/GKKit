Pod::Spec.new do |s|
  s.name         = "GKKit"
  s.version      = "0.0.1"
  s.summary      = "A Sample.so you can use it"
  s.description  = <<-DESC
                   this is gk framework, use it for test your framework. we can use it as framework.
		   DESC
  s.homepage     = "https://github.com/wongstar/GKFramework"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "wongstar" => "wongstar.iac@gmail.com" } 
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/wongstar/GKFramework.git", :tag => "#{s.version}" }
  s.source_files = 'GKKit/**/*'
  s.resource     = 'GKKit/GKResource.bundle'
  s.requires_arc = true
  s.frameworks = 'UIKit','CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary'
  #s.public_header_files='GKFramework/Classes/**/*.h'
  #s.dependency 'AFNetworking'

  
end
