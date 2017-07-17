import Foundation

extension Date {
    static var shortGermanDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter
    }()

    var short: String {
        return Date.shortGermanDateFormatter.string(from: self)
    }
}
