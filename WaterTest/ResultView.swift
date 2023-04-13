//
//  ResultView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 02/04/23.
//

import SwiftUI

struct ResultView: View {
//    @AppStorage("name") var name:String
    @AppStorage("weight") var weight: String = ""

//    @State private var result = ""
    @AppStorage("result") var result = 0.0

    func calculate() {

        let weightInt = Int(weight) ?? 0

        if weightInt <= 10 {
            result = Double(weightInt) * 100
        }else if weightInt <= 20 {
            result = (1000 + Double(weightInt) * 50)
        }else {
            result = 1500 + Double(weightInt) * 20
        }
    }
        var body: some View {
            VStack{
                Spacer()
                Text("You need to drink \(Int(result))ml today!")
                    .multilineTextAlignment(.center)
                    .onAppear(perform: calculate)
                    .font(.largeTitle)
                        .fontWeight(.bold)
                Spacer()
                Image("result")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
                NavigationLink{
                    chooseTimeView()
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

    struct ResultView_Previews: PreviewProvider {

        static var previews: some View {

            ResultView()
        }
    }

