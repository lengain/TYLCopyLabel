Pod::Spec.new do |s|
  s.name         = "TYLCopyLabel"
  s.summary      = "A Class of iOS UIKit."
  s.version      = "0.0.1"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { "lengain" => "xunzhaoyulong@163.com"}
  s.homepage     = "https://github.com/lengain/TYLCopyLabel"
  s.platform     = :ios, "6.0"
  #s.ios.deployment_target = "6.0"
  s.source       = { :git => 'https://github.com/lengain/TYLCopyLabel.git', :tag => "#{s.version}"}
  
  s.requires_arc = true
  s.source_files = "TYLCopyLabel/*.{h,m}"
  #s.public_header_files = 'TYLCopyLabel/*.{h}'
  s.frameworks = "UIKit"

end
