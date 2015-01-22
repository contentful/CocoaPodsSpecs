Pod::Spec.new do |s|
  s.name             = "ContentfulLogin"
  s.version          = "0.1.0"
  s.summary          = "Contentful login and space selection dialogs for iOS."
  s.homepage         = "https://github.com/contentful/contentful-ios-login"
  s.screenshots     = "https://raw.githubusercontent.com/contentful/contentful-ios-login/master/Login.png", "https://raw.githubusercontent.com/contentful/contentful-ios-login/master/SpaceSelection.png"
  s.license          = 'MIT'
  s.author           = { "Boris Bügling" => "boris@contentful.com" }
  s.source           = { :git => "https://github.com/contentful/contentful-ios-login.git",
                         :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/contentful'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'

  s.frameworks = 'UIKit'

  s.dependency 'ContentfulDeliveryAPI'
  s.dependency 'ContentfulManagementAPI'
  s.dependency 'ContentfulStyle'
  s.dependency 'MMProgressHUD'
  s.dependency 'SSKeychain'
end
