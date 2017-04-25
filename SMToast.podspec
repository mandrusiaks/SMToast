#
# Be sure to run `pod lib lint SMToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SMToast'
  s.version          = '0.3.5'
  s.summary          = 'SMToast is a simple way to display a message. SMToast\'s are draggable and can be stacked on the screen.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    "SMToast displays a simple notification at the bottom of any view controller. SMToast's are draggable and can be stacked on the screen. SMToast's have many customizable properties."
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
