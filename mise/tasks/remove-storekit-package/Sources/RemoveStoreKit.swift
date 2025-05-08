import Foundation
import ArgumentParser
import XcodeProj
import PathKit

@main
struct RemoveStoreKit: ParsableCommand {
    // https://swifttoolkit.dev/posts/argument-parser-guide
    // "./Projects/App/PublicMediaApps-Tuist.xcodeproj"
    @Argument(help: "projectPath to SOME.xcodeproj.")
    var projectPath: String

    func run() throws {
        print("Start removing StoreKit.framework in: \(projectPath)")

        // 1) Load the .xcodeproj
        let path = Path(projectPath)
        let xcodeProj = try XcodeProj(path: path)
        let pbxproj = xcodeProj.pbxproj
        
        // 2) Find and remove "StoreKit.framework"
        
        /* Begin PBXBuildFile section */
//        let newFileReferences = pbxproj.fileReferences.filter { fReference in
//            var result: Bool = true
//            if let path = fReference.path, path.contains("StoreKit.framework") {
//                print("remove PBXBuildFile fileReference - \(fReference.uuid) path=\(path)")
//                result = false
//            }
//            return result
//        }
//        // use the same list of fileReferences but only without "StoreKit.framework"
//        pbxproj.fileReferences = newFileReferences // <- Cannot assign to property: 'fileReferences' is a get-only property
        
        var removeFileReference = [PBXFileReference]()
        for fileReference in pbxproj.fileReferences {
            if let path = fileReference.path, path.contains("StoreKit.framework") {
                fileReference.includeInIndex = false
                print("remove PBXBuildFile fileReference - \(fileReference.uuid) path=\(path)")
                removeFileReference.append(fileReference)
            }
        }
        /* End PBXBuildFile section */
        
        /* Begin PBXFrameworksBuildPhase section */
        /* Frameworks */
        for frameworksBuildPhase in pbxproj.frameworksBuildPhases {
            if let frameworksBuildPhasesFiles: [PBXBuildFile] = frameworksBuildPhase.files {
                let newFrameworksBuildPhasesFiles: [PBXBuildFile] = frameworksBuildPhasesFiles.filter { file in
                    var result: Bool = true
                    if let fileElement = file.file, let path = fileElement.path, path.contains("StoreKit.framework") {
                        print("PBXFrameworksBuildPhase \(frameworksBuildPhase.uuid), remove PBXFileElement - fileReference - \(fileElement.uuid) path=\(path)")
                        result = false
                    }
                    return result
                }
                
                // use the same list of dependency but only without "StoreKit.framework"
                frameworksBuildPhase.files = newFrameworksBuildPhasesFiles
            }
        }
        /* End PBXFrameworksBuildPhase section */
        
        /* Begin PBXGroup section */
        for group in pbxproj.groups {
            let newChildren = group.children.filter { child in
                var result: Bool = true
                if let path = child.path, path.contains("StoreKit.framework") {
                    print("PBXGroup-\(group.uuid), remove PBXFileElement - fileReference - \(child.uuid) path=\(path)")
                    result = false
                }
                return result
            }
            
            // use the same list of groups but only without "StoreKit.framework"
            group.children = newChildren
        }
        
        // 3) Save changes back to disk
        try xcodeProj.write(path: path)

        print("Successfully removed StoreKit.framework references from \(projectPath)")
    }
}
