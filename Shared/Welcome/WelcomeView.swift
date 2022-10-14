import SwiftUI

struct WelcomeView: View {
    // MARK: - Properties
    @EnvironmentObject var userManager: UserManager
    @State var showPractice = false
    
    // MARK: - Body
    @ViewBuilder
    var body: some View {
        if showPractice {
            HomeView()
        } else {
            ZStack {
                WelcomeBackgroundImage()
                
                VStack {
                    Text(verbatim: "Hi, \(userManager.profile.name)")
                    WelcomeMessageView()
                    Button {
                        self.showPractice = true
                    } label: {
                        HStack {
                            Image(systemName: "play")
                            Text(verbatim: "Start")
                        }
                    }

                }
            }
        }
    }
}

// MARK: - Preview
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(UserManager())
    }
}
