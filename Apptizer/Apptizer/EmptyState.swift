//
//  EmptyState.swift
//  Apptizer
//
//  Created by Dev on 09/08/2024.
//

import SwiftUI

struct EmptyState: View {

    
    var body: some View {
        
            ZStack{
                Color(.systemBackground)
                VStack{
                    Image("empty-order")
                        .resizable()
                        .frame(width: 190, height: 150, alignment: .center)
                        .padding()
                    Text("You have nothing in the cart")
                    .padding()
                }.offset(y: -10)
            }

        }
        
    }


#Preview {
    EmptyState()
}
