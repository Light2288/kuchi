import SwiftUI

struct LearnView: View {
    // MARK: - Properties
    @StateObject var learningStore = LearningStore(deck: ChallengesViewModel.challenges)
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            Text("Swipe left if you remembered"
            + "\nSwipe right if you didn't")
            .font(.headline)
            DeckView(deck: learningStore.deck, onMemorized: { learningStore.score += 1 })
            Spacer()
            Text("Remembered \(learningStore.score)/\(learningStore.deck.cards.count)")
        }
        
    }
}

// MARK: - Preview
struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView()
    }
}
