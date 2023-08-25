import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/onevcat/Kingfisher", .upToNextMajor(from: "7.0.0"))
    ],
    platforms: [.iOS]
)
