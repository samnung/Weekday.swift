Pod::Spec.new do |s|
  s.name         = "Weekday"
  s.version      = "0.2"
  s.summary      = "Neat Swift library for dealing with week days"
  s.description  = <<-DESC
    Is neat Swift library for dealing with weekdays. All of us hates when we have to deal with weekdays, they don't make much sense in code. That's why exists this library.
  DESC
  s.homepage = "https://github.com/samnung/Weekday.swift"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Roman Kříž" => "roman@kriz.io" }
  s.social_media_url = "https://twitter.com/roman__kriz"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source = { :git => "https://github.com/samnung/Weekday.swift.git", :tag => s.version }
  s.source_files = "Sources/**/*"
  s.frameworks = "Foundation"
end
