//
//  chooseTimeView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 10/04/23.
//

import SwiftUI

struct chooseTimeView: View {
    @State var startTime = Date.now
    let volumeWater: [String] = ["200", "250", "300", "350", "400", "450", "500", "550", "600"]
    @State var volumeWaterChoosed = "200"
    var body: some View {
        VStack{
            Image("time").resizable().scaledToFit().frame(width:200)
            Text("Lorem ipsum dolor sit amet,  consectetur adipiscingelit, sed do eiusmod tempor")
            Form{
                Section(header: Text("Water Volume")){
                    HStack{
                        Text("Water").frame(width: 90, alignment: .leading)
                        Picker("", selection: $volumeWaterChoosed) {
                            ForEach (volumeWater, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                }
                Section(header: Text("Time")) {
                    HStack{
                        Text("Start Time")
                        DatePicker("", selection: $startTime, displayedComponents: .hourAndMinute)

                    }
                    HStack{
                        Text("Interval")
                    }
                }
            }
        }
    }
}

struct chooseTimeView_Previews: PreviewProvider {
    static var previews: some View {
        chooseTimeView()
    }
}
