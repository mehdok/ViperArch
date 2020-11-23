platform :ios, '13.0'
inhibit_all_warnings!

##
def rx_swift
    pod 'RxSwift', '~> 5.1.1'
end

##
def rx_cocoa
    pod 'RxCocoa', '~> 5.1.1'
end

##
def rx_data_source
  pod 'RxDataSources', '~> 4.0'
end

##
def rx_gesture
  pod 'RxGesture', '~>3.0.2'
end

##
def king_fisher
  pod 'Kingfisher', '~> 5.15.7'
end

##
def object_mapper
  pod 'ObjectMapper', '~> 4.2.0'
end

##
def moya
  pod 'Moya/RxSwift', '~> 14.0'
end

##
def floating_panel
  pod 'FloatingPanel'
end

##
def moya_mapper
  pod 'Moya-ObjectMapper/RxSwift'
end

##
def network_pods
  rx_swift
  object_mapper
  moya
  moya_mapper
end

####
target 'DomainLayer' do
    use_frameworks!
    workspace 'ViperArch'
    project 'DomainLayer/DomainLayer.xcodeproj'
    
    rx_swift

target 'DomainLayerTests' do
      inherit! :search_paths
      # Pods for testing
      
    end
end

####
target 'NetworkLayer' do
    use_frameworks!
    workspace 'ViperArch'
    project 'NetworkLayer/NetworkLayer.xcodeproj'
    
    network_pods
    
    target 'NetworkLayerTests' do
      inherit! :search_paths
      # Pods for testing
      
      
    end
end

target 'ViperArch' do
  use_frameworks!

  # Pods for MarvelApiTest
  network_pods
  rx_cocoa
  rx_data_source
  rx_gesture
  king_fisher
  floating_panel

  target 'ViperArchTests' do
    inherit! :search_paths
    # Pods for testing
    
  end

  target 'ViperArchUITests' do
    # Pods for testing
  end

end
