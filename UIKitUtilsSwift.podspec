Pod::Spec.new do |s|
	s.name				= "UIKitUtilsSwift"
	s.version			= "0.0.1"
	s.summary			= "Utilities for UIKit in Swift."
	s.description		= <<-DESC
						Utilities for UIKit in Swift, inprired by [uikit-utils](https://github.com/mruegenberg/uikit-utils)
						DESC
	s.homepage			= "https://github.com/hons82/UIKitUtilsSwift"
	s.license			= { :type => "MIT", :file => "LICENSE" }
	s.author			= { "Hannes Tribus" => "hons82@gmail.com" }
	s.platform			= :ios, "8.0"
	s.source			= { :git => "https://github.com/hons82/UIKitUtilsSwift.git", :tag => "v#{s.version}" }
	s.source_files		= "UIKitUtilsSwift/UIKitUtilsSwift.h", "UIKitUtilsSwift/Drawing/*.{swift}"
	s.exclude_files		= "Classes/Exclude"
	s.framework			= "UIKit"
end