Pod::Spec.new do |s|
	s.name     = 'MACTextField'
	s.version  = '0.0.2'
	s.license  = { :type => 'MIT' }
	s.homepage = 'https://github.com/madson/MACTextField'
	s.summary  = "UITextField subclass that implements a 'top placeholder' in the top of UITextField view."
	s.authors  = { 'Madson Mac' => 'madsonmac@gmail.com' }
	s.source   = { :git => 'https://github.com/madson/MACTextField.git' }
	s.source_files = ['MACTextField/MACTextField.h', 'MACTextField/MACTextField.m']
	s.requires_arc = true
end

