

import SwiftUI

struct ButtonAP: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
        .frame(width: 260, height: 50)
        .background(Color.green)
        .foregroundColor(.white)
        .fontWeight(.bold)
        .cornerRadius(10)
    }
}

#Preview {
    ButtonAP(title: "Test Title")
}
