import Foundation
import StuWeDD

func getTransactions(username: String, password: String) -> [Transaction] {
    var transactions = [Transaction]()
    let semaphore = DispatchSemaphore(value: 0)

    Cardservice.login(username: username, password: password) { result in
        guard let service = try? result.get() else { return }

        let lastweek = Date().addingTimeInterval(-60 * 60 * 24 * 7)
        let now = Date()
        service.transactions(begin: lastweek, end: now) { result in
            guard let t = try? result.get() else { return }

            transactions = t
            semaphore.signal()
        }
    }
    semaphore.wait()

    return transactions
}
