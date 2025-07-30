
import SwiftUI

final class OrderEO: ObservableObject{
    @Published var items = [appitzier]()
    @Published var myDictionary: [String: Int] = [:]
   
    func gettotalPrice() -> Double {
        var total = 0.0
        for item in items{
            var helper = 0.0
            if let q = myDictionary[item.name]{
                helper = item.price * Double(q)
                total += helper
            }
        }
        return total
    }
    
    
    func checkkey(name: String) -> Bool{
        for item in items{
            if name == item.name{
                return false
            }
        }
        return true
    }
    
    var flag = false
    func add (item: appitzier) {
        flag = checkkey(name: item.name)
        if flag {
            print ("bello world")
            myDictionary[item.name] = 1
            items.append(item)
        }
        else if flag == false{
            if let quantity = myDictionary[item.name] {
                myDictionary[item.name] = quantity + 1
            }
        }
    }
}

struct ContentView: View {
    @StateObject var main = OrderEO()
    var body: some View {
        TabView{
            
            AppitizerListView()
                .tabItem {
                   
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house") }
                    )
                }
            Account()
                .tabItem {
                    Label(
                        title: { Text("Person") },
                        icon: { Image(systemName: "person") }
                    )
                }
            
            order()
                .tabItem {
                    Label(
                        title: { Text("Order") },
                        icon: { Image(systemName: "bag") }
                    )
                }
                .badge(main.items.count)
            }
        
        .environmentObject(main)
    }
}
#Preview {
    ContentView().environmentObject(OrderEO())
}
