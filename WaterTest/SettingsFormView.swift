//
//  SettingsFormView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI

struct SettingsFormView: View {

    let pickerValue = PickerValue()

    @Binding var userWeight: String
    @Binding var timerIntervalChoosed: Int
    @Binding var volumeWaterChoosed: Int
    
    var body: some View {
        Form{
            Section(header: Text("General settings")){
                HStack{
                    Text("Weight").frame(width: 100, alignment: .leading)
                    TextField("", text: $userWeight).textFieldStyle(SuffixTextFieldStyle(suffix: "Kg")).keyboardType(.numberPad)
                }
            }
            Section(header:Text("Water intake per drink")){
                HStack{
                    Text("Water Volume")
                    Picker("", selection: $volumeWaterChoosed) {
                        ForEach (pickerValue.volumeWaterList, id: \.self) {
                            Text("\($0) ml").tag($0)
                        }
                    }
                }
            }
            Section(header: Text("Time Settings")) {
                HStack{
                    Text("Reminder Interval")
                    Picker("", selection: $timerIntervalChoosed) {
                        ForEach(pickerValue.volumeWaterList, id: \.self) {
                            Text("\($0) minutes").tag($0)
                        }
                    }
                }
            }
        }.scrollContentBackground(.hidden)
    }
}

struct SettingsFormView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsFormView(userWeight: .constant("35"), timerIntervalChoosed: .constant(30), volumeWaterChoosed: .constant(300))
    }
}
