//
//  ChooseTimerAndWaterLevelView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 14/08/23.
//

import SwiftUI

struct FormTimerAndWaterLevelView: View {

    let pickerValue = PickerValue()

    @Binding var waterVolumeChoosed: Int
    @Binding var timerIntervalChoosed: Int

    var body: some View {
        Form{
            Section(header: Text("volume per drink")){
                HStack{
                    Text("Water Volume")
                    Picker("", selection: $waterVolumeChoosed) {
                        ForEach (pickerValue.volumeWaterList , id: \.self) {
                            Text("\($0) ml").tag($0)
                        }
                    }
                }
            }
            Section(header: Text("reminder setup")) {
                HStack{
                    Text("Reminder Interval")
                    Picker("", selection: $timerIntervalChoosed) {
                        ForEach(pickerValue.timeIntervalList, id: \.self) {
                            Text("\($0) minutes").tag($0)
                        }
                    }
                }
            }
        }.frame(width: 400)
            .scrollContentBackground(.hidden)
    }
}
struct FormTimerAndWaterLevelView_Previews: PreviewProvider {
    static var previews: some View {
        FormTimerAndWaterLevelView(waterVolumeChoosed: .constant(200), timerIntervalChoosed: .constant(30))
    }
}
