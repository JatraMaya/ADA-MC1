//
//  DataView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 02/04/23.
//

import SwiftUI

struct DataView: View {
    
    @AppStorage("name") private var name = ""
    @AppStorage("weight") private var weight = ""

    func disabledButton() -> Bool {
        return name.isEmpty || weight.isEmpty
    }
    var body: some View {
        VStack(spacing: 24){
            Spacer()
            Spacer()
            Image("data-input")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            Text("First, we need to calculate your daily water intake goal based on your weight. Don't worry, this will only takes a minute!")
                .multilineTextAlignment(.center)
                .font(.system(size: 15))
                .frame(width: 300)
            Spacer()
            Form{
                HStack{
                    Text("Name").frame(width: 80, alignment: .leading)
                    TextField("Your Name", text: $name)
                }
                HStack{
                    Text("Weight").frame(width: 80, alignment: .leading)
                    TextField("Your Weight", text: $weight)
                        .textFieldStyle(SuffixTextFieldStyle(suffix: "Kg"))
                        .keyboardType(.numberPad)
                }
            }.scrollContentBackground(.hidden)
                .padding( -35)
            NavigationLink {
                ResultView()
            }label: {
                Text("calculate".uppercased())
                    .font(disabledButton() ? .caption : .headline)
                    .foregroundColor(disabledButton() ? .white : .white)
                    .frame(width: 320.0, height: 50.0)
                    .background(disabledButton() ? .gray : .blue
                    )
                    .cornerRadius(10)
            }.disabled(disabledButton())
        }.padding(24)
    }
}


struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
