//
//  emailVerification.swift
//  Apptizer
//
//  Created by Dev on 18/07/2025.
//


import Foundation

extension String{
    
    func isValidEmail(name: String) -> Bool {
        // Define a regular expression for validating email addresses
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: name)
        
    }
}
