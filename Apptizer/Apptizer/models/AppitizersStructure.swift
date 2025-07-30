//
//  AppitizersStructure.swift
//  Apptizer
//
//  Created by Dev on 06/08/2024.
//

import Foundation


struct appitzier: Codable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let carbs: Double
    let protein: Int
    let calories: Int
}

class Another: Codable{
    var request : [appitzier]
}

struct MockData{
    
    static let sampleAppitizer = appitzier(id: 0001,
                                    name: "Creamy Burger",
                                    description: "This is delicious and very yummy you should give it a try to maek your life beautiful and wonderful",
                                    price: 1.32,
                                    imageURL: "",
                                    carbs: 90,
                                    protein: 90,
                                    calories: 90)
    
    static let appitizers = [sampleAppitizer, sampleAppitizer , sampleAppitizer , sampleAppitizer ]
}
