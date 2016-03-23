desc 'Run tests'
task :test do
  command = "xcodebuild \
    -project UIKitUtilsSwift.xcodeproj \
    -scheme UIKitUtilsSwift \
    -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=latest' \
    test"
  system(command) or exit 1
end

task :default => :test