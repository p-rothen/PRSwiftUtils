Pod::Spec.new do |s|
 
  # 1
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "PRSwiftUtils"
  s.summary = "Utils for Swiftssssss"
  s.requires_arc = true
 
  # 2
  s.version = "1.0"
 
  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }
 
  # 4 - Replace with your name and e-mail address
  s.author = { "Pedro" => "p.rothen@outlook.cl" }
 
  # 5 - Replace this URL with your own Github page's URL (from the address bar)
  s.homepage = "https://github.com/p-rothen"
 
  # 6 - Replace this URL with your own Git URL from "Quick Setup"
  s.source = { :git => "https://github.com/p-rothen/PRSwiftUtils.git", :tag => "#{s.version}"}
 
  # 7
  s.framework = "UIKit"
  #s.dependency 'Alamofire', '~> 3.2.1'
 
  # 8
  s.source_files = "PRSwiftUtils/**/*.{swift}"
 
  # 9
  #s.resources = "PRSwiftUtils/**/*.{png,jpeg,jpg,storyboard,xib}"
end
