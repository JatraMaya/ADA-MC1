//
//  DataView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 02/04/23.
//

import SwiftUI

struct UserDataInputView: View {

    // Instantiate AppStorage with UserDefaultValues object
    @StateObject var userDefaultValues = UserDefaultValues()

    var body: some View {
        VStack(spacing: 24){
            Image("data-input")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text("First, we need to calculate your daily water intake goal based on your weight. Don't worry, this will only take less then a minute!")
                .multilineTextAlignment(.center)
                .font(.system(size: 15))
                .frame(width: 300)
            Spacer()
            onBoardingFormView(username: userDefaultValues.$username, userWeight: userDefaultValues.$userWeight)
            NavigationLink {
                CalculationResultView()
            }label: {
                Text("calculate".uppercased())
                    .font(controlCalculateButtonState() ? .caption : .headline)
                    .foregroundColor(controlCalculateButtonState() ? .white : .white)
                    .frame(width: 320.0, height: 50.0)
                    .background(controlCalculateButtonState() ? .gray : .blue
                    )
                    .cornerRadius(10)
            }.disabled(controlCalculateButtonState())
        }.padding(24)
    }
}


struct UserDataInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserDataInputView()
    }
}
