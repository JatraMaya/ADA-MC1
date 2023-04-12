//
//  DataView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 02/04/23.
//

import SwiftUI

struct DataView: View {
    
    @AppStorage("name") private var name = ""
    @AppStorage("age") private var age = ""
    @AppStorage("weight") private var weight = ""
    @AppStorage("gender") private var gender = "Male"

    func disabledButton() -> Bool {
        return name.isEmpty || age.isEmpty || weight.isEmpty
    }

    var body: some View {
        VStack(spacing: 30){
            Spacer()
            Image("data-input")
                .resizable()
                .scaledToFit()
                .frame(width: 350)
            Text("Lorem ipsum dolor sit amet,  consectetur adipiscingelit, sed do eiusmod tempor")
                .multilineTextAlignment(.center)
                .font(.system(size: 15))
                .frame(width: 300)
            Form{
                HStack{
                    Text("Name").frame(width: 80, alignment: .leading)
                    TextField("Your Name", text: $name)
                }
                HStack{
                    Text("Age").frame(width: 80, alignment: .leading)
                    TextField("Your Age", text: $age).keyboardType(.numberPad)
                }
                HStack{
                    Text("Weight").frame(width: 80, alignment: .leading)
                    TextField("Your Weight in kg", text: $weight)
                        .textFieldStyle(SuffixTextFieldStyle(suffix: "Kg"))
                        .keyboardType(.numberPad)
                }
                HStack{
                    Text("Gender").frame(width: 80, alignment: .leading)
                    Picker(selection: $gender) {
                        Text("Male").tag("Male")
                        Text("Female").tag("Female")
                    } label: {
                    }.pickerStyle(.segmented)
                }
            }.scrollContentBackground(.hidden)
                .padding(.top, -35)
            NavigationLink {
                ResultView(name: $name, age: $age, weight: $weight, gender: $gender)
            }label: {
                Text("calculate".uppercased())
                    .font(disabledButton() ? .caption : .headline)
                    .foregroundColor(disabledButton() ? .black : .white)
                    .frame(width: 320.0, height: 40.0)
                    .background(disabledButton() ? .gray : .blue
                    )
                    .cornerRadius(10)
            }.disabled(disabledButton())
        }
    }
}

//extension Binding where Value == String {
//    func max(_ limit: Int) -> Self {
//        if self.wrappedValue.count > limit {
//            DispatchQueue.main.async {
//                self.wrappedValue = String(self.wrappedValue.dropLast())
//            }
//        }
//        return self
//    }
//}





struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
