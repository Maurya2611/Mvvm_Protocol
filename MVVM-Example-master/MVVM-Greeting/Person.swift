import Foundation
struct Person {
  var salutation: String
  var firstName: String
  var lastName: String
  var birthdate: Date
}
extension Person {
  static func steveJobs() -> Person {
    var birthdateComponents = DateComponents()
    birthdateComponents.year = 1955
    birthdateComponents.month = 2
    birthdateComponents.day = 24
    let birthdate = Calendar.current.date(from: birthdateComponents)!
    return Person(salutation: "Mr.", firstName: "Steve", lastName: "Jobs", birthdate: birthdate)
  }
}
