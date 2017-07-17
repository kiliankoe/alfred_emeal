import Foundation

extension Double {
    var priceValue: String {
        return String(format: "%.2f€", self)
    }
}
