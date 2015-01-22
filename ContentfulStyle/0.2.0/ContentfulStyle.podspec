Pod::Spec.new do |s|
  s.name             = "ContentfulStyle"
  s.version          = "0.2.0"
  s.summary          = "Assets and code required to make an iOS project with standard Contentful design."
  s.homepage         = "https://github.com/contentful/contentful-ios-style"
  s.license          = 'MIT'
  s.author           = { "Boris Bügling" => "boris@contentful.com" }
  s.source           = { :git => "https://github.com/contentful/contentful-ios-style.git",
                         :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/contentful'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.frameworks = 'UIKit'

  s.dependency 'LatoFont'
  s.dependency 'EDColor'
end
