
import SwiftUI

struct Account: View {
    @StateObject var viewmodel = AccontViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("PERSONAL INFO")){
                    TextField("First Name", text: $viewmodel.user.Firstaname)
                        .onSubmit {
                            viewmodel.focused = .lastname
                        }
                    TextField("Last Name", text: $viewmodel.user.Lastaname)
                        .onSubmit {
                            viewmodel.focused = .email
                        }
                    TextField("email", text: $viewmodel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                    
                    DatePicker("Birthday", selection: $viewmodel.user.Birthday, displayedComponents: .date)
                }
                
                Section(header: Text("REQUESTS")){
                    Toggle("Extra Napkins", isOn: $viewmodel.user.extranapkins)
                    Toggle("FreQuent Refills", isOn: $viewmodel.user.frequent)
                }
                Section(header: Text("KNOW ABOUT US")){
                    Link("Terms and policy", destination: URL(string: "https://www.apple.com")!)
                    Link("About Us", destination: URL(string: "https://www.apple.com")!)
                }
                
                
            }
            
            .navigationTitle("Accounts")
            
            
            .toolbar{
                ToolbarItem{
                    Button{
                        viewmodel.saveChanges()
                    }label: {
                        Text("Save")
                    }
                }
            }
            
            .padding()
        }
        .alert(item: $viewmodel.alertitem){ alertitem in
            Alert(title: alertitem.title, message: alertitem.message, dismissButton: alertitem.dismissButton)
            
        }
        .onAppear(){
            viewmodel.RetrivedData()
        }
    }
}

#Preview {
    Account()
}
