#
#  Be sure to run `pod spec lint STUtilities.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "STUtilities"
  s.version      = "0.0.4"
  s.summary      = "A package of useful codes to start a project quickly, private use."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  A package of useful codes to start a project quickly, private use.
  Now it contains:
  1.Base64
  2.JSONKit
  3.CocoaSecurity
  4.SQLCipher
  5.LKDBHelper
  6.STSafeCategory
  7.MJRefresh
  8.IQKeyboardManager
  9.PureLayout
  10.DeviceUtil
  11.AFNetworking
  12.SDWebImage
  13.Toast
  14.NSDate-Extensions
  15.KDCycleBannerView
  16.GZIP
  17.MYBlurIntroductionView
  18.NJKWebViewProgress
  19.SCViewShaker
  20.Other
                   DESC

  s.homepage     = "https://github.com/tscc01/STUtilities"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "Sola Li" => "tscc01@163.com" }
  # Or just: s.author    = "Sola Li"
  # s.authors            = { "Sola Li" => "tscc01@163.com" }
  # s.social_media_url   = "http://twitter.com/Sola Li"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  s.platform     = :ios, "7.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/tscc01/STUtilities.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "STUtilities/STUtilities/*.{h,m}"
  s.subspec 'STContext' do |ss|
    ss.platform     = :ios, "7.0"

    ss.source_files =  "STUtilities/STUtilities/STContext/*.{h,m}"
  end

  s.subspec 'BasicUtility' do |ss|
    ss.platform     = :ios, "7.0"

    ss.dependency 'STUtilities/STContext'
    ss.source_files =  "STUtilities/STUtilities/BasicUtility/*.{h,m}"

  end

  s.subspec 'Category' do |ss|
    ss.platform     = :ios, "7.0"

    ss.subspec 'NSMutableAttributedString+ST' do |sss|
      sss.platform     = :ios, "7.0"
      sss.source_files = "STUtilities/STUtilities/Category/NSMutableAttributedString+ST.{h,m}"
    end

    ss.subspec 'NSObject+ST' do |sss|
      sss.platform     = :ios, "7.0"
      sss.source_files = "STUtilities/STUtilities/Category/NSObject+ST.{h,m}"
    end

    ss.subspec 'UIImage+animatedGIF' do |sss|
      sss.platform     = :ios, "7.0"
      sss.source_files = "STUtilities/STUtilities/Category/UIImage+animatedGIF.{h,m}"
    end

    ss.subspec 'UIView+ST' do |sss|
      sss.platform     = :ios, "7.0"
      sss.source_files = "STUtilities/STUtilities/Category/UIView+ST.{h,m}"
    end

    ss.subspec 'UITableViewCell+ST' do |sss|
      sss.platform     = :ios, "7.0"
      sss.dependency 'STUtilities/Category/UIView+ST'
      sss.source_files = "STUtilities/STUtilities/Category/UITableViewCell+ST.{h,m}"
    end

    ss.subspec 'UIColor+ST' do |sss|
      sss.platform     = :ios, "7.0"
      sss.source_files = "STUtilities/STUtilities/Category/UIColor+ST.{h,m}"
    end

    ss.subspec 'UIViewController+ST' do |sss|
      sss.platform     = :ios, "7.0"
      sss.dependency 'STUtilities/Category/NSObject+ST'
      sss.source_files = "STUtilities/STUtilities/Category/UIViewController+ST.{h,m}"
    end

    ss.subspec 'UINavigationController+ST' do |sss|
      sss.platform     = :ios, "7.0"
      sss.dependency 'STUtilities/Category/NSObject+ST'
      sss.source_files = "STUtilities/STUtilities/Category/UINavigationController+ST.{h,m}"
    end

    ss.subspec 'UIViewController+SplashView' do |sss|
      sss.platform     = :ios, "7.0"
      sss.dependency 'STUtilities/Category/UIColor+ST'
      sss.dependency 'STUtilities/Category/UIView+ST'
      sss.dependency 'STUtilities/Category/UIImage+animatedGIF'

      sss.source_files = "STUtilities/STUtilities/Category/UIViewController+SplashView/*.{h,m}"
      sss.subspec 'HUDProgressView' do |ssss|
        ssss.platform     = :ios, "7.0"
        ssss.source_files = "STUtilities/STUtilities/Category/UIViewController+SplashView/HUDProgressView/*.{h,m}"
      end

      sss.subspec 'LoadingSplashView' do |ssss|
        ssss.platform     = :ios, "7.0"
        ssss.source_files = "STUtilities/STUtilities/Category/UIViewController+SplashView/LoadingSplashView/*.{h,m}"
      end

      sss.subspec 'NoneDataView' do |ssss|
        ssss.platform     = :ios, "7.0"
        ssss.source_files = "STUtilities/STUtilities/Category/UIViewController+SplashView/NoneDataView/*.{h,m}"
      end

      sss.subspec 'SplashFailedView' do |ssss|
        ssss.platform     = :ios, "7.0"
        ssss.source_files = "STUtilities/STUtilities/Category/UIViewController+SplashView/SplashFailedView/*.{h,m}"
      end
    end
  end


  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  s.dependency 'Base64', '~> 1.1.2'
  s.dependency 'CocoaSecurity', '~> 1.2.4'
  s.dependency 'SQLCipher', '~> 3.1.0'
  s.dependency 'LKDBHelper', '~> 2.3'
  s.dependency 'STSafeCategory', '~> 0.0.2'
  s.dependency 'MJRefresh', '~> 3.1.12'
  s.dependency 'IQKeyboardManager', '~> 3.2.2'
  s.dependency 'PureLayout', '~> 2.0.5'
  s.dependency 'DeviceUtil', '~> 1.2'
  s.dependency 'AFNetworking', '~> 2.5'
  s.dependency 'SDWebImage', '~> 3.7.5'
  s.dependency 'Toast', '~> 2.4'
  s.dependency 'NSDate-Extensions', '~> 0.0.1'
  s.dependency 'KDCycleBannerView', '~> 1.1.1'
  s.dependency 'GZIP', '~> 1.1.1'
  s.dependency 'MYBlurIntroductionView', '~> 1.0.3'
  s.dependency 'NJKWebViewProgress', '~> 0.2.3'
  s.dependency 'SCViewShaker', '~> 1.0.2'

end
