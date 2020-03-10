import Foundation

@objc class Person: NSObject {
    @objc dynamic var name = "Taylor Swift"
}

let taylor = Person()
taylor.observe(\Person.name, options: [.old, .new]) { person, change in
    print("My name changed from \(change.oldValue!) to \(change.newValue!)")
}
taylor.name = "Ome"
