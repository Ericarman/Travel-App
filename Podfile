# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def shared_pods
  pod 'Firebase/Core'
  pod 'Firebase/Firestore'
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Storage'
  pod 'Protobuf', :inhibit_warnings => true
end

target 'TravelApp' do
    shared_pods
end

target 'TravelApp Driver' do
    shared_pods
end
