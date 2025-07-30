//
//  TotalBillView.swift
//  Apptizer
//
//  Created by Dev on 09/08/2024.
//

//import SwiftUI
//
//struct TotalBillView: View {
//   
//    @EnvironmentObject var main: OrderEO
//    var body: some View {
//        
//        ZStack{
//            Color(.systemBackground)
//            VStack{
//                Text("Transcript: ")
//                    .frame(alignment: .center)
//                ForEach(main.items){ item in
//                    Text("\(item.name) :    \(item.price)")
//                }
//                Text("Total Bill: \(main.gettotalPrice(), specifier: "%.1f")")
//                    .padding()
//                    .padding(.bottom, 100)
//                
//                Button{
//                    ContentView()
//                }label: {
//                    ButtonAP(title: "Home")
//                }
//            }
//            .frame(width: 300, height: 525)
//            .background(Color.white)
//            .cornerRadius(10)
//            .shadow(radius: 20)
//        }
//    }
//}
//
//#Preview {
//    TotalBillView().environmentObject(OrderEO())
//}
