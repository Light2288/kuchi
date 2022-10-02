import SwiftUI

struct WelcomeMessageView: View {
    var body: some View {
        Label {
            VStack(alignment: .leading) {
                Text("Welcome to")
                    .font(.headline)
                    .bold()
                Text("Kuchi")
                    .font(.largeTitle)
                    .bold()
            }
            .foregroundColor(.red)
            .lineLimit(1)
            .padding(.horizontal)
        } icon: {
            LogoImageView()
        }
        .labelStyle(HorizontallyAlignedLabelStyle())
    }
}

// MARK: - Preview
struct WelcomeMessageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeMessageView()
    }
}
