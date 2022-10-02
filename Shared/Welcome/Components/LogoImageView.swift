import SwiftUI

struct LogoImageView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        Image(systemName: "table")
            .resizable()
            .frame(width: 30, height: 30)
            .cornerRadius(15)
            .overlay(Circle().stroke(.gray, lineWidth: 1))
            .background(Color(white: 0.9))
            .clipShape(Circle())
            .foregroundColor(.red)
    }
}

// MARK: - Preview
struct LogoImageView_Previews: PreviewProvider {
    static var previews: some View {
        LogoImageView()
    }
}
