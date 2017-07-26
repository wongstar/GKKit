Pod::Spec.new do |s|
  s.name         = "GKKit"
  s.version      = "0.0.7"
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

  s.subspec 'Base' do |ss|
    ss.source_files= 'GKKit/**/*.{h,m}'
    #ss.public_header_files='GKKit/**/*.{h}
  end

  s.subspec 'Model' do |ss|
    ss.source_files= 'GKKit/**/*.{h,m}'
    #ss.public_header_files='GKKit/**/*.{h}'
  end

  s.subspec 'Utils' do |ss|
    ss.source_files= 'GKKit/**/*.{h,m}'
    #ss.public_header_files='GKKit/**/*.{h}'
  end

  s.subspec 'View' do |ss|
    ss.source_files= 'GKKit/**/*.{h,m}'
    #ss.public_header_files='GKKit/**/*.{h}'
  end

  s.subspec 'ThirdPart' do |ss|
    ss.source_files='GKKit/**/*.{h,m}'
    ss.resource ='GKKit/ThirdPart/MJRefresh/MJRefresh.bundle'
  end


 

  s.requires_arc = true
  s.frameworks = 'UIKit','CoreFoundation', 'CoreText', 'CoreGraphics', 'CoreImage', 'QuartzCore', 'ImageIO', 'AssetsLibrary'
  #.public_header_files='GKFramework/Classes/**/*.h'
  #s.dependency 'AFNetworking'

  
end
