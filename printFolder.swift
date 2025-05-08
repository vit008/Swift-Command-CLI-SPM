#!/usr/bin/env swift

// Description:
// This Swift script lists all files and subdirectories in a specified folder.
// It takes a folder path as a command-line argument, checks if the path exists
// and is a directory, and then prints the contents. If the folder is empty or
// an error occurs, it provides appropriate feedback.

// Example Usage:
// ./printFolder.swift ~/Documents
// Output might be:
// Contents of /Users/username/Documents:
//   - Report.pdf
//   - Project
//   - Notes.txt

// How to Make Executable:
//    chmod +x printFolder.swift
// Why Make Executable:
// The `chmod +x` command sets the executable permission, allowing the script to
// be run directly from the terminal using `./printFolder.swift` without needing
// to invoke the Swift compiler explicitly. The shebang (#!/usr/bin/env swift)
// tells the system to use the Swift interpreter to execute the script.

import Foundation

func listFolderContents(atPath path: String) {
    let fileManager = FileManager.default
    
    do {
        // Get contents of the directory
        let contents = try fileManager.contentsOfDirectory(atPath: path)
        
        // Print each item
        if contents.isEmpty {
            print("Folder is empty")
        } else {
            print("Contents of \(path):")
            for item in contents {
                print("  - \(item)")
            }
        }
    } catch {
        print("Error: Unable to read folder contents - \(error.localizedDescription)")
    }
}

func main() {
    // Get command line arguments
    let arguments = CommandLine.arguments
    
    // Check if path is provided
    guard arguments.count > 1 else {
        print("Usage: \(arguments[0]) <folder_path>")
        print("Example: \(arguments[0]) /Users/username/Documents")
        exit(1)
    }
    
    let folderPath = arguments[1]
    
    // Check if path exists and is a directory
    var isDirectory: ObjCBool = false
    let exists = FileManager.default.fileExists(atPath: folderPath, isDirectory: &isDirectory)
    
    guard exists else {
        print("Error: Path '\(folderPath)' does not exist")
        exit(1)
    }
    
    guard isDirectory.boolValue else {
        print("Error: '\(folderPath)' is not a directory")
        exit(1)
    }
    
    // List contents
    listFolderContents(atPath: folderPath)
}

// Run the program
main()