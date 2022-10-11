import SwiftUI

@main
struct KuchiApp: App {
    let userManager = UserManager()
    
    init() {
        userManager.load()
    }
    
  var body: some Scene {
    WindowGroup {
        StarterView()
            .environmentObject(userManager)
            .environmentObject(ChallengesViewModel())
    }
  }
}

struct KuchiApp_Previews: PreviewProvider {
  static var previews: some View {
      StarterView()
  }
}
