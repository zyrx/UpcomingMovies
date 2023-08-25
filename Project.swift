import ProjectDescription
import ProjectDescriptionHelpers


// MARK: - Project

let projectName = "UpcomingMovies"

let infoPlist: [String: InfoPlist.Value] = [
    "CFBundleShortVersionString": "1.1",
    "CFBundleVersion": "1",
    "UIMainStoryboardFile": "",
    "UILaunchStoryboardName": "LaunchScreen"
]

let mainTarget = Target(
    name: projectName,
    platform: .iOS,
    product: .app,
    bundleId: "net.mavels.\(projectName)",
    infoPlist: .extendingDefault(with: infoPlist),
    sources: ["Targets/\(projectName)/Sources/**"],
    resources: ["Targets/\(projectName)/Resources/**"],
    dependencies: [
        .external(name: "SnapKit"),
        .external(name: "Kingfisher")
    ]
)

let testTarget = Target(
    name: "\(projectName)Tests",
    platform: .iOS,
    product: .unitTests,
    bundleId: "net.mavels.\(projectName)Tests",
    infoPlist: .default,
    sources: ["Targets/\(projectName)/Tests/**"],
    dependencies: [
        .target(name: "\(projectName)")
])

let project = Project(
    name: projectName,
    organizationName: "mavels.net",
    targets: [
        mainTarget,
        testTarget
    ]
)


