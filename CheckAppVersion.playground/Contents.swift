import UIKit

func normalizeVersion(_ version: String, toLength length: Int) -> String {
    var components = version.split(separator: ".").map(String.init)
    while components.count < length {
        components.append("0")
    }
    return components.joined(separator: ".")
}

func compareVersions(_ current: String, _ appStore: String) -> ComparisonResult {
    let currentComponents = current.split(separator: ".").map(String.init)
    let appStoreComponents = appStore.split(separator: ".").map(String.init)
    let maxLength = max(currentComponents.count, appStoreComponents.count)
    
    let normalizedCurrent = normalizeVersion(current, toLength: maxLength)
    let normalizedAppStore = normalizeVersion(appStore, toLength: maxLength)
    
    return normalizedCurrent.compare(normalizedAppStore, options: .numeric)
}

let current = "1.4"
let appStore = "1.4.0"
let versionCompare = compareVersions(current, appStore)

if versionCompare == .orderedSame {
    print("same version")
} else if versionCompare == .orderedAscending {
    print("ask user to update")
} else if versionCompare == .orderedDescending {
    print("don't expect happen...")
}
