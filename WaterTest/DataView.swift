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
        VStack(spacing: 24){
            VStack(spacing: 8){
                Text("Input Data")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Lorem ipsum dolor sit amet,  consectetur adipiscingelit, sed do eiusmod tempor")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15))
                .frame(width: 300)
                
            }
            Image("data-input")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
            
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
                ResultView(name: $name, age: $age, weight: $weight, gender: $gender)
            }label: {
                Text("calculate".uppercased())
                    .font(disabledButton() ? .caption : .headline)
                    .foregroundColor(disabledButton() ? .white : .white)
                    .frame(width: 320.0, height: 50.0)
                    .background(disabledButton() ? .gray : .blue
                    )
                    .cornerRadius(4)
            }.disabled(disabledButton())
        }.padding(24)
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
