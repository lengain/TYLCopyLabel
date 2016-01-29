Pod::Spec.new do |s|
  s.name         = 'TYLCopyLabel'
  s.summary      = 'A Class of iOS UIKit.’
  s.version      = ‘1.0’
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { ‘Lengain’ => ‘xunzhaoyulong@163.com’ }
  s.social_media_url = 'https://github.com/lengain'
  s.homepage     = 'https://github.com/lengain/TYLCopyLabel'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source       = { :git => 'https://github.com/lengain/TYLCopyLabel', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'TYLCopyLabel/*.{h,m}'
  s.public_header_files = 'TYLCopyLabel/*.{h}'

  s.ios.exclude_files = non_arc_files
  s.subspec 'no-arc' do |sna|
    sna.requires_arc = false
    sna.source_files = non_arc_files
  end

  s.frameworks = 'UIKit'

end
