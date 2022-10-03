import SwiftUI


struct RegisterView: View {
    // MARK: - Properties
    @EnvironmentObject var userManager: UserManager
    
    @FocusState var nameFieldFocused: Bool
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            WelcomeMessageView()
            TextField("Type your name...", text: $userManager.profile.name)
                .submitLabel(.done)
                .bordered()
            
            HStack {
                Spacer()
                
                Text("\(userManager.profile.name.count)")
                    .font(.caption)
                    .foregroundColor(
                        userManager.isUserNameValid() ? .green : .red
                    )
                    .padding(.trailing)
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16, alignment: .center)
                    Text("OK")
                        .font(.body)
                        .bold()
                }
            }
            .bordered()
            .disabled(!userManager.isUserNameValid())
            
            Spacer()
        }
        .padding()
        .background(WelcomeBackgroundImage())
    }
}

// MARK: - Event Handlers
extension RegisterView {
    func registerUser() {
        userManager.persistProfile()
    }
}

// MARK: - Preview
struct RegisterView_Previews: PreviewProvider {
    static let user = UserManager(name: "Ray")
    
    static var previews: some View {
        RegisterView()
            .environmentObject(user)
    }
}
