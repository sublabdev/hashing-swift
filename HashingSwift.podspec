Pod::Spec.new do |s|
  s.name             = 'HashingSwift'
  s.version          = '1.0.0'
  s.summary          = 'Set of hashing functions in Swift'
  s.homepage         = 'https://github.com/sublabdev/hashing-swift'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Substrate Laboratory LLC' => 'info@sublab.dev' }
  s.source           = { :git => 'https://github.com/sublabdev/hashing-swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.source_files = 'Sources/HashingSwift/**/*'
  s.dependency 'CommonSwift', '1.0.0'
  s.dependency 'KeccakSwift', '1.0.0'
  s.dependency 'xxHash-Swift', '1.1.1'
  s.dependency 'Base58Swift', '2.1.10'
  s.dependency 'Blake2', '0.1.2'
end
