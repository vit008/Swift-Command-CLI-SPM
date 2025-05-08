// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [
            "GoogleTagManager": .staticFramework,
            
            "FirebaseCore": .staticFramework,
            "FirebaseAuth": .staticFramework,
            "FirebaseMessaging": .staticFramework,
            "FirebasePerformance": .staticFramework,
            "FirebaseCrashlytics": .staticFramework,
            "FirebaseAnalytics": .staticFramework,
            "FirebaseStorage": .staticFramework,
        ]
    )
#endif

let package = Package(
    name: "GreenMoonApp-Package",
    dependencies: [
        // You can read more about dependencies here: https://docs.tuist.io/documentation/tuist/dependencies
        
        // Firebase (Core, Auth, Messaging, Performance, Crashlytics, Analytics, Storage)
        // Add Firebase SDKs to your app https://firebase.google.com/docs/ios/setup#add-sdks
        // Releases: https://github.com/firebase/firebase-ios-sdk/releases
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "11.8.1"),
        
        // GoogleTagManager
        // https://developers.google.com/tag-platform/tag-manager/ios/v5#swift-package-manager
        .package(url: "https://github.com/googleanalytics/google-tag-manager-ios-sdk", exact: "8.0.0"),
    ])
