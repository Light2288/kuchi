import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var challengeViewModel: ChallengesViewModel
    @AppStorage("learningEnabled") var learningEnabled: Bool = true
    
  var body: some View {
      TabView {
          if learningEnabled {
              LearnView()
                  .tabItem {
                      VStack {
                          Image(systemName: "bookmark")
                          Text("Learn")
                      }
                  }
                  .tag(0)
          }
          PracticeView(
              challengeTest: $challengeViewModel.currentChallenge,
              userName: $userManager.profile.name,
              numberOfAnswered: .constant(challengeViewModel.numberOfAnswered))
              .tabItem {
                  VStack {
                      Image(systemName: "rectangle.dock")
                      Text("Settings")
                  }
              }
              .tag(1)
          SettingsView()
              .tabItem {
                  VStack {
                      Image(systemName: "gear")
                      Text("Settings")
                  }
              }
              .tag(2)
      }
      .accentColor(.orange)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
          .environmentObject(UserManager())
          .environmentObject(ChallengesViewModel())
  }
}
