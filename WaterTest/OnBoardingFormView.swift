//
//  OnBoardingFormView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI


struct onBoardingFormView: View {

    @Binding var username: String
    @Binding var userWeight: String

    var body: some View {
        Form{
            HStack{
                Text("Name").frame(width: 80, alignment: .leading)
                TextField("Your Name", text: $username)
            }
            HStack{
                Text("Weight").frame(width: 80, alignment: .leading)
                TextField("Your Weight", text: $userWeight)
                    .textFieldStyle(SuffixTextFieldStyle(suffix: "Kg"))
                    .keyboardType(.numberPad)
            }
        }.scrollContentBackground(.hidden)
            .padding( -35)
    }
}


struct OnBoardingFormView_Previews: PreviewProvider {
    static var previews: some View {
        onBoardingFormView(username: .constant("Sm"), userWeight: .constant("14"))
    }
}
