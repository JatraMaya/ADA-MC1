//
//  TestView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 11/04/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("name") private var name = ""
    @AppStorage("age") private var age = ""
    @AppStorage("weight") private var weight = ""
    @AppStorage("gender") private var gender = "male"
    
    var body: some View {
        Form{
                HStack{
                    Text("Age").frame(width: 100, alignment: .leading)
                    TextField("", text: $age)
                }
            
            HStack{
                Text("Weight").frame(width: 100, alignment: .leading)
                TextField("", text: $weight).textFieldStyle(SuffixTextFieldStyle(suffix: "Kg"))
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
