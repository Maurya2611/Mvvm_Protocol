import Foundation
func doInBackground(_ block: @escaping () -> (Void())) {
  DispatchQueue.global(qos: .default).async {
    block()
  }
}
func doOnMain(_ block: @escaping () -> (Void())) {
  DispatchQueue.main.async {
    block()
  }
}
