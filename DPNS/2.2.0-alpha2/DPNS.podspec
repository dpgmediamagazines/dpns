Pod::Spec.new do |s|
  s.name             = "DPNS"
  s.version          = "2.2.0-alpha2"
  s.summary          = "DPNS iOS library"
  s.homepage         = "https://mondriaan.com"
  s.license          = 'Propietary'
  s.author           = { "Máté Csengeri" => "mate.csengeri@mondriaan.com", "Gergely Németh" => "gergely.nemeth@mondriaan.com" }
  s.source           = { :http => "https://pods.sanomamdc.com/DPNS/DPNS-2.2.0-alpha2.zip" }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.subspec 'Common' do |common|
      common.frameworks = 'UIKit'
      common.vendored_libraries = 'DPNS/libDPNSCommon.a'
  end

  s.subspec 'Core' do |core|
      core.source_files = 'DPNS/DPNS.h', 'DPNS/DPNSLocationScope.h', 'DPNS/DPNSInboxItem.h', 'DPNS/DPNSInboxWebView.h'
      core.vendored_libraries = 'DPNS/libDPNS.a'
      core.ios.resource_bundle = {'DPNSResources' => 'DPNS/DPNSResources.bundle/*.nib'}
      core.frameworks = 'UserNotifications', 'CoreLocation', 'WebKit'
      core.library = 'z'
      core.dependency 'DPNS/Common'
      core.dependency 'DPNS/Encryption'
  end

  s.subspec 'Tracker' do |tracker|
      tracker.source_files = 'DPNS/DPNSTracker.h', 'DPNS/DPNSNotificationServiceExtension.h'
      tracker.vendored_libraries = 'DPNS/libDPNSTracker.a'
      tracker.frameworks = 'UserNotifications'
      tracker.dependency 'DPNS/Common'
      tracker.dependency 'DPNS/Encryption'
  end

  s.subspec 'Encryption' do |encryption|
      encryption.source_files = 'DPNS/DPNSMessage.h'
      encryption.vendored_libraries = 'DPNS/libDPNSEncryption.a'
      encryption.dependency 'DPNS/Common'
      encryption.frameworks = 'Security'
  end

end
