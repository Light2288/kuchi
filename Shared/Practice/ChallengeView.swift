import SwiftUI

struct ChallengeView: View {
    let challengeTest: ChallengeTest
    @State var showAnswers = false
    @Binding var numberOfAnswered: Int
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.questionsPerSession) var questionsPerSession
    
    @ViewBuilder
    var body: some View {
        if verticalSizeClass == .compact {
            VStack {
                HStack {
                    Button(action: {
                        showAnswers.toggle()
                    }) {
                        QuestionView(question: challengeTest.challenge.question)
                    }
                    if(showAnswers) {
                        Divider()
                        ChoicesView(challengeTest: challengeTest)
                    }
                }
                ScoreView(numberOfQuestions: questionsPerSession, numberOfAnswered: $numberOfAnswered)
            }
        } else {
            VStack {
                Button(action: {
                    showAnswers.toggle()
                }) {
                    QuestionView(question: challengeTest.challenge.question)
                        .frame(height: 300)
                }
                ScoreView(numberOfQuestions: questionsPerSession, numberOfAnswered: $numberOfAnswered)
                if(showAnswers) {
                    Divider()
                    ChoicesView(challengeTest: challengeTest)
                        .frame(height: 300)
                        .padding()
                }
            }
        }
    }
}


struct ChallengeView_Previews: PreviewProvider {
    static let challengeTest = ChallengeTest(
        challenge: Challenge(
            question: "おねがい　します",
            pronunciation: "Onegai shimasu",
            answer: "Please"
        ),
        answers: ["Thank you", "Hello", "Goodbye"]
    )
    @State static var numberOfAnswered: Int = 0
    static var previews: some View {
        return ChallengeView(challengeTest: challengeTest, numberOfAnswered: $numberOfAnswered)
            .previewInterfaceOrientation(.portrait)
    }
}
