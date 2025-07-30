
import Foundation
import SwiftUI




final class AccontViewModel: ObservableObject{
    @AppStorage("user") private var userdata: Data?
    @Published var user = User()
    @Published var alertitem: AlertItem?
    @FocusState  var focused: FousedState?
    
    enum FousedState{
        case firstname, lastname, email
    }
    
    
    func checkvalid() -> Bool{
        if user.Firstaname.isEmpty && user.Lastaname.isEmpty && user.email.isEmpty{
            print ("Please fill all the columns")
            return false
        }
        
        if !user.email.isValidEmail(name: user.email) {
            alertitem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        if !checkvalid() {
            return
        }
        
        do {
            
            let data = try JSONEncoder().encode(user) //  Encode into JSON
            userdata = data // Store the json
            alertitem = AlertContext.validEmail
            
        }catch{
            alertitem = AlertContext.invalidData
        }
    }
    
    func RetrivedData(){
        do {
            guard let data = userdata else{ // Step 2 convert into data
                return
            }
            user = try JSONDecoder().decode(User.self, from: data) //  Step 3 decode into struct
            
        }catch{
            print("Unable to Decode data")
        }
    }
}
