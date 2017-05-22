#
# Be sure to run `pod lib lint SMToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SMToast'
  s.version          = '0.4.0'
  s.summary          = 'SMToast is a simple way to display a message. SMToast\'s are draggable and can be stacked on the screen.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
"SMToast provides a fast and simple way to display a short message. It works great for showing error messages during development, or notifying users of successful actions. SMToasts will present one on top of the next, as long as they will fit on the screen. If they cannot fit, the leftover SMToasts are added to the "onHold" queue where they will be presented in the position of the most recently expired toast. SMToast's are draggable and can be moved around the screen; perfect for times when you need to move a toast that overlays an important piece of information in your app.

SMToast now allows users to flick away a toast whenever they want. This way, if any toasts are bothering the user and are still in the process of fading away, they have a fun, interactive way of dismissing the toast. Another new feature is being able to enable/disable the onHoldQueue (disabled by default). Simply open SMToast and change ``` "
                       DESC

  s.homepage         = 'https://github.com/mandrusiaks/SMToast'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mandrusiaks' => 'mandrusiaks@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/mandrusiaks/SMToast.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SMToast/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SMToast' => ['SMToast/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
