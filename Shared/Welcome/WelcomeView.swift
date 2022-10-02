import SwiftUI

struct WelcomeView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ZStack {
            WelcomeBackgroundImage()
            
            WelcomeMessageView()
        }
    }
}

// MARK: - Preview
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
