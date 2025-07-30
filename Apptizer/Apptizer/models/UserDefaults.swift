//
//  UserDefaults.swift
//  Apptizer
//
//  Created by Dev on 09/08/2024.
//

import Foundation
import SwiftUI

struct User: Codable{
    var Firstaname = ""
    var Lastaname  = ""
    var email = ""
    var Birthday = Date()
    var extranapkins = false
    var frequent = false
    var isShowing = false
}
