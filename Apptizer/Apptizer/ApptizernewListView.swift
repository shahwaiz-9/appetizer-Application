
import SwiftUI

struct AppitizerNewView: View {
    let appitizer: appitzier
    let Quantity: Int
    var body: some View {
        HStack{
            
            RemoteimageLoader(Urlstring: appitizer.imageURL)
            //AsyncImage(url: URL(string: appitizer.imageURL))
                .frame(width: 110, height: 80)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
            
            VStack(alignment: .leading){
                Text(appitizer.name)
                    .frame(alignment: .leading)
                    .font(.title2)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
                    .padding(.bottom, 3)
                HStack(spacing: 30){
                    Text("$\(appitizer.price, specifier: "%.1f") ")
                        
                        .font(.system(size: 13))
                        .foregroundColor(.secondary) //  Gray is the same
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                    Text("Quantity: \(Quantity)x")
                        
                        .font(.system(size: 13))
                        .foregroundColor(.secondary) //  Gray is the same
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                }
                
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppitizerView(appitizer: MockData.sampleAppitizer) // Using default appitizer
}
