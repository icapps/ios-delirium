#
# Be sure to run `pod lib lint Delirium.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Delirium'
  s.version          = '0.2.0'
  s.summary          = 'A set of UI components that we tend to reuse at iCapps.'
  s.description      = <<-DESC
Delirium contains a set of UI components for reuse. Like for example:

- Shake your `UIView`.
- Present a `UIAlertController` from an `NSError`.
                       DESC

  s.homepage         = 'https://github.com/icapps/ios-delirium'
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { 'Jelle Vandebeeck' => 'jelle@fousa.be' }
  s.source           = { git: 'https://github.com/icapps/ios-delirium.git', tag: s.version.to_s }
  s.social_media_url = 'https://twitter.com/icapps'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*'
  s.resource_bundles = {
    'Delirium' => [
      'Assets/**/*.strings',
      'Assets/**/*.storyboard'
    ]
  }
end
