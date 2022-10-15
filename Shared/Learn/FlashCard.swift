import Foundation

struct FlashCard: Identifiable {
    let id = UUID()
    var isActive = true
    var card: Challenge
}

extension FlashCard: Equatable {
    static func == (lhs: FlashCard, rhs: FlashCard) -> Bool {
        return lhs.card.question == rhs.card.question && lhs.card.answer == rhs.card.answer
    }
}
