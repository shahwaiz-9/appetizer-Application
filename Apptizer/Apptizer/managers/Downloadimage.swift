
import Foundation
import SwiftUI

final class LoadingImage: ObservableObject{
    @Published var image : Image?
    
    func Load(urlstring: String){
        NetworkManager.Networkmanager.downloadingImage(passedString: urlstring){ uiimage in
            
            guard let uiimage = uiimage else{
                return
            }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage) // UIimage conversion
            }
        }
    }
}

struct Remoteimage:View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct RemoteimageLoader:View {
    @StateObject var shahwaiz  = LoadingImage()
    var Urlstring: String
    var body: some View {
        Remoteimage(image: shahwaiz.image)
        
            .onAppear(){
                shahwaiz.Load(urlstring: Urlstring)
            }
        
    }
    
    func getimage() -> Image {
        return shahwaiz.image ?? Image("place-holder")
    }
}

