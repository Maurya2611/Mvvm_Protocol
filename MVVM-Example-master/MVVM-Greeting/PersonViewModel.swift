import Foundation
struct PersonViewModel {
  var person: Person
}
extension PersonViewModel {
  var nameText: String {
    if person.salutation.characters.count > 0 {
      return "\(person.salutation) \(person.firstName) \(person.lastName)"
    } else {
      return "\(person.firstName) \(person.lastName)"
    }
  }
  var birthdateText: String {
    return PersonViewModel.dateFormatter.string(from: person.birthdate)
  }
  fileprivate static var dateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    return formatter
  }
}
