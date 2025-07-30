

import SwiftUI

struct order: View {
    @EnvironmentObject var main: OrderEO
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                   List{
                       ForEach(main.items) { ordereditem in
                           AppitizerNewView(appitizer: ordereditem, Quantity: main.myDictionary[ordereditem.name] ?? 0)
                        }
                        // delete at index
                        .onDelete(perform: { indexSet in
                            main.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(.plain)
                    
                    Button{
                        //TotalBillView()
                        
                        main.items.removeAll()
                    }label: {
                        ButtonAP(title: "$\(main.gettotalPrice(), specifier: "%.1f") Total")
                    }
                    .padding(.bottom, 20)
                
                }
                
                if main.items.isEmpty {
                    EmptyState()
                }
            }
            .navigationTitle("Orders")
        }
        .padding()
    }
}
#Preview {
    order().environmentObject(OrderEO())
}
