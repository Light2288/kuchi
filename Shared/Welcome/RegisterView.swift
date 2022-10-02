import SwiftUI


struct RegisterView: View {
    // MARK: - Properties
    @State var name: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            WelcomeMessageView()
            TextField("Type your name...", text: $name)
                .bordered()
            
            Spacer()
        }
        .padding()
        .background(WelcomeBackgroundImage())
    }
}

// MARK: - Preview
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
