
import Foundation
import SwiftUI


struct LoadingView: UIViewRepresentable{
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let variable = UIActivityIndicatorView(style: .large)
        variable.color = UIColor(named: "AccentColor")
        variable.startAnimating()
        return variable
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}

    
    
    
}


struct Loading: View{
    var body: some View{
        ZStack{
            Color (.systemBackground)
                .ignoresSafeArea()
            LoadingView() // Calls the UI kit
        }
    }

}
