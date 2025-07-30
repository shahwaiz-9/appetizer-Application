
import Foundation
import SwiftUI
struct AlertItem : Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData = AlertItem(title: Text("Invalid Data"), message: Text("Something is wrong retry."), dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Invalid URL"), message: Text("The URL is not valid."), dismissButton: .default(Text("OK")))
    
    static let Unable = AlertItem(title: Text("Unable to connect URL"), message: Text("Please check your internet connection."), dismissButton: .default(Text("OK")))
    
    static let invalidRequest = AlertItem(title: Text("Unable to connect URL"), message: Text("Make sure you have entered correct request."), dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"), message: Text("Error 404 Not Found!!"), dismissButton: .default(Text("OK")))
    static let invalidEmail = AlertItem(title: Text("Invalid Email"), message: Text("Email is incorrect"), dismissButton: .default(Text("OK")))
    static let validEmail = AlertItem(title: Text("Congratulations"), message: Text("Data is Saved successfully"), dismissButton: .default(Text("OK")))
}




