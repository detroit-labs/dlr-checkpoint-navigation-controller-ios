Pod::Spec.new do |s|
  s.name             = "DLRCheckpointNavigationController"
  s.version          = "1.0.0"
  s.summary          = "Provides checkpoints when popping to the root view controller."
  s.homepage         = "https://github.com/detroit-labs/dlr-checkpoint-navigation-controller-ios"
  s.license          = 'MIT'
  s.author           = { "Nathan Walczak" => "nate.walczak@detroitlabs.com" }
  s.source           = { :git => "https://github.com/detroit-labs/dlr-checkpoint-navigation-controller-ios.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/detroitlabs'

  s.platform     = :ios
  s.requires_arc = true

  s.source_files = 'DLRCheckpointNavigationController/source/**/*'

  s.public_header_files = 'DLRCheckpointNavigationController/source/**/*.h'
end
