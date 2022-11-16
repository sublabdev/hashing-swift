Pod::Spec.new do |s|
  s.name             = 'HashingSwift'
  s.version          = '1.0.0'
  s.summary          = 'Set of hashing functions in Swift'

  # s.description      = <<-DESC
  # TODO: Add long description of the pod here.
  #                      DESC
  
  s.homepage         = 'https://github.com/sublabdev/HashingSwift'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Tigran Iskandaryan' => 'tiger@sublab.dev' }
  s.source           = { :git => 'https://github.com/sublabdev/HashingSwift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'HashingSwift/Classes/**/*'
end
