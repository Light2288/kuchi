import SwiftUI

struct WelcomeBackgroundImage: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Image("welcome-background", bundle: nil)
            .resizable()
            .aspectRatio(1/1, contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .saturation(0.5)
            .blur(radius: 5)
            .opacity(0.08)
    }
}

// MARK: - Preview
struct WelcomeBackgroundImage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeBackgroundImage()
    }
}
