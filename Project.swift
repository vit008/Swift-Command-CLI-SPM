import ProjectDescription


// Helper function to check if entitlements file exists
func entitlements() -> Entitlements? {
    let result: Entitlements = .dictionary([
        "aps-environment": .string("development"),
        "com.apple.developer.applesignin": .array([
            .string("Default")
        ]),
        "Can be debugged": .boolean(true)
    ])
    return result
}


let project = Project(
    name: "GreenMoon",
    targets: [
        .target(
            name: "GreenMoonApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.GreenMoonApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["GreenMoonApp/Sources/**"],
            resources: ["GreenMoonApp/Resources/**"],
            entitlements: entitlements(),
            dependencies: [
//                .external(name: "GoogleTagManager"),

                // https://firebase.google.com/docs/ios/setup#available-pods
                .external(name: "FirebaseCore"),
//                .external(name: "FirebaseAuth"),
//                .external(name: "FirebaseMessaging"),
//                .external(name: "FirebasePerformance"),
//                .external(name: "FirebaseCrashlytics"),
                .external(name: "FirebaseAnalytics"),
//                .external(name: "FirebaseStorage"),
            ]
        ),
        .target(
            name: "GreenMoonAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.GreenMoonApp",
            infoPlist: .default,
            sources: ["GreenMoonApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "GreenMoonApp")]
        ),
    ]
)
