import SwiftUI

struct DetailView: View {
    
    let name: appitzier
    @Binding var isshowingDetail: Bool
    @EnvironmentObject var main: OrderEO
    var flag = true
    var body: some View {
        
        VStack {
            RemoteimageLoader(Urlstring: name.imageURL)
                .frame(width: 300, height: 200)
                .overlay(alignment: .topTrailing){
                    Button{
                        isshowingDetail = false
                    }label: {
                        
                        Image(systemName: "x.circle.fill")
                            .frame(width: 20, height: 20)
                            .padding(.all, 5)
                            .foregroundColor(.gray)
                        
                    }
                }
            
            Text(name.name)
            
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .foregroundColor(Color.black)
            
            Text(name.description)
            
                .frame(width: 260, alignment: .center)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
                .foregroundColor(Color.black)
            
            HStack(spacing: 40) {
                shortVS(title: "Carbs", value: name.carbs)
                shortVS(title: "Protiens", value: Double(name.protein))
                shortVS(title: "Calories", value: Double(name.calories))
                
            }
            .padding(.bottom, 20)
            
            Button{
                isshowingDetail = false
                main.add(item: name)
            }label: {
                ButtonAP(title: "$\(name.price, specifier: "%.1f") - Add to Order")
                
            }
            .padding()
            Spacer()
        }
        
        .frame(width: 300, height: 525)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}
#Preview {
    DetailView(name: MockData.sampleAppitizer, isshowingDetail: .constant(true)).environmentObject(OrderEO())
}


struct shortVS: View {
    let title: String
    let value: Double
    var body: some View {
        VStack(spacing: 4){
            Text(title)
            
                .font(.system(size: 12))
                .fontWeight(.bold)
            
            Text("\(value, specifier:"%.1f")")
            
                .font(.system(size: 12))
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
                .lineLimit(3)
                .foregroundColor(.gray)
        }
    }
}

