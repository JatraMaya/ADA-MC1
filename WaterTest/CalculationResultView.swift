//
//  ResultView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 02/04/23.
//

import SwiftUI

struct CalculationResultView: View {

    // Instantiate AppStorage with UserDefaultValues object
    @StateObject var userDefaultValues = UserDefaultValues()

    var body: some View {
            VStack{
                Spacer()
                Text("You need to drink \(Int(userDefaultValues.result))ml per day!")
                    .multilineTextAlignment(.center)
                    .onAppear(perform: calculateWaterNeeds)
                    .font(.largeTitle)
                        .fontWeight(.bold)
                Spacer()
                Image("result")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
                NavigationLink{
                    ChooseWaterLevelTimeView()
                }label: {
                    Text("Continue")
                        .frame(width: 320.0, height: 50.0)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(4)
                }
                .padding(24)
            }
        }
    }

struct CalculationResultView_Previews: PreviewProvider {

    static var previews: some View {

        CalculationResultView()
    }
}

