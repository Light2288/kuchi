import SwiftUI

struct CardView: View {
    // MARK: - Properties
    let flashCard: FlashCard
    
    init(_ card: FlashCard) {
        self.flashCard = card
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.red)
                .frame(width: 320, height: 210)
                .cornerRadius(12)
            VStack {
                Spacer()
                Text(flashCard.card.question)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text(flashCard.card.answer)
                    .font(.caption)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .shadow(radius: 0)
        .frame(width: 320, height: 210)
        .animation(.spring(), value: 0)
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = FlashCard(card: Challenge(question: "こんにちわ", pronunciation: "Konnichiwa", answer: "Hello"))
        CardView(card)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
