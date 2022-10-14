import SwiftUI

struct ScoreView: View {
    // MARK: - Properties
    @Binding var numberOfQuestions: Int
    @Binding var numberOfAnswered: Int
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text("\(self.numberOfAnswered)/\(numberOfQuestions)")
                .font(.caption)
                .padding(4)
            Spacer()
        }
    }
}

// MARK: - Preview
struct ScoreView_Previews: PreviewProvider {
    @State static var numberOfAnswered: Int = 0
    @State static var numberOfQuestions: Int = 6
    static var previews: some View {
        ScoreView(numberOfQuestions: $numberOfQuestions,
                  numberOfAnswered: $numberOfAnswered)
    }
}
