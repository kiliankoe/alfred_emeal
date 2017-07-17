import Foundation
import SwiftAlfred

guard let username = ProcessInfo.processInfo.environment["EMEAL_USERNAME"] else { fatalError("No username specified") }
guard let password = ProcessInfo.processInfo.environment["EMEAL_PASSWORD"] else { fatalError("No password specified") }

let transactions = getTransactions(username: username, password: password)

var items = [Item]()
for transaction in transactions {
    for position in transaction.positions {
        items.append(Item(title: "\(position.name) \(position.price.priceValue)", subtitle: "\(transaction.date.short) @ \(transaction.location)"))
    }
}

let res = Response()
res.add(items: items.reversed())

print(res.toJSON())
