//
//  AppitizzerViewModel.swift
//  Apptizer
//
//  Created by Dev on 08/08/2024.
//

import Foundation
import SwiftUI


final class AppitizzerViewModel: ObservableObject {
    
    
    @Published  var appetizers: [appitzier] = []
    @Published var alertitem: AlertItem?
    @Published var isloading = false
    @Published var isshowingDetail = false
    @Published var Selectedap :  appitzier?
    
    
    
//    func getAppetizers() {
//        isloading = true
//        NetworkManager.Networkmanager.getappitizers { result in
//            DispatchQueue.main.async {
//                self.isloading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    
//                    switch  error{
//                        
//                    case .invalidURL:
//                        self.alertitem = AlertContext.invalidURL
//                    case .invaliData:
//                        self.alertitem = AlertContext.invalidData
//
//                    case .invalidResponse:
//                        self.alertitem = AlertContext.invalidResponse
//
//                    case .invalidRequest:
//                        self.alertitem = AlertContext.invalidRequest
//
//                    case .Unable:
//                        self.alertitem = AlertContext.Unable
//
//                    }
//                }
//            }
//        }
//
//    }
    func getAppetizers(){
        isloading = true
        Task{
            do{
                appetizers = try await NetworkManager.Networkmanager.getappitizers() // It automatically connect to main thread we dont need " DispatchQueue.main.async "
                
            } catch{
                alertitem = AlertContext.Unable // This will be over written
            }
        }
    }
}
