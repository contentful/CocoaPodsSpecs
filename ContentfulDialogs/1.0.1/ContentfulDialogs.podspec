Pod::Spec.new do |s|
  s.name             = "ContentfulDialogs"
  s.version          = "1.0.1"
  s.summary          = 'Informational dialogs for iOS applications, like "About Us", licensing information and a quick overview of the product.'
  s.homepage         = "https://github.com/contentful/contentful-ios-dialogs"
  s.license          = 'MIT'
  s.author           = { "Boris Bügling" => "boris@contentful.com" }
  s.source           = { :git => "https://github.com/contentful/contentful-ios-dialogs.git",
                         :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/contentful'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.resources = 'Pod/Assets/*.png'
  s.source_files = 'Pod/Classes'
  s.public_header_files = 'Pod/Classes/CDA{AboutUsView,Tutorial,Web}Controller.h',
                          'Pod/Classes/UIView+Geometry.h'

  s.frameworks = 'UIKit'
  s.weak_framework = 'SafariServices'
  
  s.dependency 'CocoaMarkdown'
  s.dependency 'CGLMail'
  s.dependency 'ContentfulDeliveryAPI', '~> 1.9.0'
  s.dependency 'DDPageControl'
  s.dependency 'TSMiniWebBrowser@dblock'
end
