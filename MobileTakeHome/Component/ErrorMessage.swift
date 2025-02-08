//
//  ErrorMessage.swift
//  MobileTakeHome
//
//  Created by ray williams on 2/6/25.
//

import SwiftUI

struct ErrorMessage: View {
    
    let errorMessage: String?
    
    var body: some View {
        VStack {
            Image(systemName: "list.bullet.clipboard.fill")
                .font(.largeTitle)
            Text("Sorry we are currently facing some issue")
            if let message = errorMessage {
                Text(message)
            }
        }
    }
}

#Preview {
    ErrorMessage(errorMessage: "Error")
}
