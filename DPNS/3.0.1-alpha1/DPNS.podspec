Pod::Spec.new do |s|
    s.name              = 'DPNS'
    s.version           = '3.0.1-alpha1'
    s.summary           = 'DPNS iOS SDK'
    s.homepage          = 'https://mondriaan.com/'
    s.author            = { 'Levente Dimény' => 'levente.dimeny@mondriaan.com' }
    s.license           = 'Propietary'
    s.platform          = :ios
    s.source            = { :http => "https://pods.sanomamdc.com/DPNS/DPNS-3.0.1-alpha1.zip" }
    s.ios.deployment_target = '9.0'
    s.module_name = 'DPNS'

    s.subspec 'Common' do |common|
    common.vendored_frameworks = 'DPNS/DPNSCommon.xcframework'
    common.frameworks = 'Security'
    end

    s.subspec 'Core' do |core|
    core.vendored_frameworks = 'DPNS/DPNS.xcframework'
    core.ios.resource_bundle = {'DPNSResources' => 'DPNS/DPNSResources.bundle/*.nib'}
    core.frameworks = 'Foundation', 'UIKit', 'CoreLocation'
    core.dependency 'ZIPFoundation', '0.9.11'
    core.dependency 'DPNS/Common'
    end

    s.subspec 'Tracker' do |tracker|
    tracker.vendored_frameworks = 'DPNS/DPNSTracker.xcframework'
    tracker.frameworks = 'UserNotifications'
    tracker.dependency 'DPNS/Common'
    end
end
