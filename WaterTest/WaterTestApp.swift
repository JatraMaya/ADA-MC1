//
//  WaterTestApp.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 31/03/23.
//

import SwiftUI

 @main
struct WaterTestApp: App {
    @AppStorage("setupIsDone") var setupIsDone: Bool = false
    var body: some Scene {
        WindowGroup {
            if !setupIsDone{
                WelcomeView()
            }else{
                DrinkTrackerView()
            }
        }
    }
}


// Utils Struct 
struct SuffixTextFieldStyle: TextFieldStyle {
    var suffix: String

    func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
                .padding(.trailing, 30) // add some padding to make room for the suffix
            Text(suffix)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(height: 44) // adjust the height as needed
    }
}


