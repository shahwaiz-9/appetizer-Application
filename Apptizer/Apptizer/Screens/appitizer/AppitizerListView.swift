//
//  AppitizerListView.swift
//  Apptizer
//
//  Created by Dev on 06/08/2024.
//


import SwiftUI

struct AppitizerListView: View {
    
    @StateObject var viewmodel = AppitizzerViewModel()
    var body: some View {
        ZStack{
            NavigationView{
                List{
                    
                    // Iterating over each element in an array
                    
                    ForEach(viewmodel.appetizers){appitizer in
                        
                        AppitizerView(appitizer: appitizer)
                            .onTapGesture {
                                viewmodel.Selectedap = appitizer
                                viewmodel.isshowingDetail = true
                            }
                    }
                    
                }
                .listStyle(.plain)
                .navigationTitle("Appitizers")
                .onAppear {
                    viewmodel.getAppetizers()
                }
                
                .sheet(isPresented: $viewmodel.isshowingDetail) {
                    if let newapp = viewmodel.Selectedap {
                        DetailView(name: newapp, isshowingDetail: $viewmodel.isshowingDetail)
                    }
                }
                
                if viewmodel.isloading == true {
                    Loading()
                }
                
            }
            
            .alert(item: $viewmodel.alertitem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }
}

#Preview {
    AppitizerListView()
}
