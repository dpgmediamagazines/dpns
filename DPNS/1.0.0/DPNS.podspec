Pod::Spec.new do |s|
  s.name             = "SPNS"
  s.version          = "0.0.1"
  s.summary          = "Sanoma Push Notification System iOS library"
  s.homepage         = "http://www.sanomamdc.com"
  s.license          = 'Propietary'
  s.author           = { "Gábor Horváth" => "gabor.horvath@sanoma.com" }
  s.source           = { :http => "https://pods.sanomamdc.com/SPNS/SPNS-0.0.1.zip" }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.subspec 'Common' do |common|
    common.frameworks = 'UIKit'
    common.vendored_libraries = 'SPNS/libSPNSCommon.a'
  end

  s.subspec 'Core' do |core|
      core.source_files = 'SPNS/SPNS.h', 'SPNS/SPNSLocationScope.h', 'SPNS/SPNSInboxItem.h', 'SPNS/SPNSInboxWebView.h'
      core.vendored_libraries = 'SPNS/libSPNS.a'
      core.ios.resource_bundle = {'SPNSResources' => 'SPNS/SPNSResources.bundle/*.nib'}
      core.frameworks = 'UserNotifications', 'CoreLocation', 'WebKit'
      core.library = 'z'
      core.dependency 'SPNS/Common'
      core.dependency 'SPNS/Encryption'
  end

  s.subspec 'Tracker' do |tracker|
      tracker.source_files = 'SPNS/SPNSTracker.h', 'SPNS/SPNSNotificationServiceExtension.h'
      tracker.vendored_libraries = 'SPNS/libSPNSTracker.a'
      tracker.dependency 'SPNS/Common'
      tracker.dependency 'SPNS/Encryption'
  end

  s.subspec 'Encryption' do |encryption|
    encryption.source_files = 'SPNS/SPNSMessage.h'
    encryption.vendored_libraries = 'SPNS/libSPNSEncryption.a'
    encryption.dependency 'SPNS/Common'
    encryption.frameworks = 'Security'
  end
end
