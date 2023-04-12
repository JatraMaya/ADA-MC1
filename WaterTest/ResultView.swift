//
//  ResultView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 02/04/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var name:String
    @Binding var age: String
    @Binding var weight: String
    @Binding var gender: String

    @State var result = ""

    func calculate() {

        var calc = 0.0

        if gender.lowercased() == "male" {
            if Int(age)! >= 19 {

                calc = 2.447 
//                calc = (Double(weight)! * 0.033) + 500
                result = "You Need to drink " + String(calc) + "ml Today!"
            } else {
                calc = (Double(weight) ?? 0 * 0.033) + 500
                result = "You Need to drink " + String(calc) + "ml Today!"
            }
        } else {
            calc = Double(weight) ?? 0 * 0.033
            result = "You Need to drink " + String(calc) + "ml Today!"
        }
    }

        var body: some View {
            VStack{
                Spacer()
                Text(result).onAppear(perform: calculate)
                Spacer()
                Image("result")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Spacer()
                NavigationLink{
                    chooseTimeView(age: $age, weight: $weight)
                }label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width:300, height: 40)
                        .background(.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }

    }

    struct ResultView_Previews: PreviewProvider {

        static var previews: some View {

            ResultView(name: .constant("test"), age: .constant("test"), weight: .constant("test"), gender: .constant("test"))
        }
    }

