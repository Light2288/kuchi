import SwiftUI

struct DeckView: View {
    // MARK: - Properties
    @ObservedObject var deck: FlashDeck
    
    let onMemorized: () -> Void
    
    init(deck: FlashDeck, onMemorized: @escaping () -> Void) {
        self.onMemorized = onMemorized
        self.deck = deck
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            ForEach(deck.cards.filter { $0.isActive }) { card in
                getCardView(for: card)
            }
        }
    }
    
    func getCardView(for card: FlashCard) -> CardView {
        let activeCards = deck.cards.filter { $0.isActive }
        if let lastCard = activeCards.last {
            if lastCard == card {
                return createCardView(for: card)
            }
        }
        
        let view = createCardView(for: card)
        return view
    }
    
    func createCardView(for card: FlashCard) -> CardView {
        let view = CardView(card)
        return view
    }
}

// MARK: - Preview
struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: FlashDeck(from: ChallengesViewModel.challenges), onMemorized: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
