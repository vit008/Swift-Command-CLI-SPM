import ProjectDescription

let project = Project(
    name: "SpaceForApps",
    targets: [
        .target(
            name: "SpaceForApps",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.SpaceForApps",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["SpaceForApps/Sources/**"],
            resources: ["SpaceForApps/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "SpaceForAppsTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.SpaceForAppsTests",
            infoPlist: .default,
            sources: ["SpaceForApps/Tests/**"],
            resources: [],
            dependencies: [.target(name: "SpaceForApps")]
        ),
    ]
)
