Pod::Spec.new do |s|
  s.name             = 'APIVerveSEOQuickValidator'
  s.version          = '1.2.3'
  s.summary          = 'SEO Quick Validator inspects live web pages for on-page SEO errors and tag issues.'
  s.description      = <<-'DESC'
SEO Quick Validator inspects live web pages for on-page SEO errors and tag issues. Pass any URL to inspect title lengths, meta descriptions, H1 headings, viewport and canonical tags, image alt text, and unverified external links.

This iOS/macOS SDK provides a convenient way to access the SEO Quick Validator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/seovalidator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/seovalidator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveSEOQuickValidator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
