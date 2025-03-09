Pod::Spec.new do |s|
  s.name             = 'HTTPTypes'
  s.version          = '1.0.0'
  s.summary          = 'Swift HTTP types for request and response handling'
  s.description      = <<-DESC
                       Swift HTTP types that provide a unified way to work with HTTP requests and responses 
                       across different frameworks and platforms.
                       DESC
  s.homepage         = 'https://github.com/lagary/swift-http-types'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE.txt' }
  s.author           = { 'Apple Inc.' => 'swift-http-types@group.apple.com' }
  s.source           = { :git => 'https://github.com/lagary/swift-http-types.git', :tag => s.version.to_s }
  
  s.swift_version = '5.9'
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  
  # Define main HTTPTypes subspec
  s.subspec 'Core' do |core|
    core.source_files = 'Sources/HTTPTypes/**/*'
    core.compiler_flags = '-enable-experimental-feature StrictConcurrency=complete -enable-upcoming-feature MemberImportVisibility'
  end
  
  # Define HTTPTypesFoundation subspec
  s.subspec 'Foundation' do |foundation|
    foundation.source_files = 'Sources/HTTPTypesFoundation/**/*'
    foundation.dependency 'HTTPTypes/Core'
    foundation.compiler_flags = '-enable-experimental-feature StrictConcurrency=complete -enable-upcoming-feature MemberImportVisibility'
  end
  
  # Set default subspecs
  s.default_subspec = 'Core'
end
