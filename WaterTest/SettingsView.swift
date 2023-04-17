////
////  TestView.swift
////  WaterTest
////
////  Created by Ahmad Fadly Iksan on 11/04/23.
////
//
//import SwiftUI
//
//struct SettingsView: View {
//    @AppStorage("name") private var name = ""
//    @AppStorage("weight") private var weight = ""
//    @AppStorage("volumeWaterChoosed") var volumeWaterChoosed = 200
//    @AppStorage("intervalChoosed") var intervalChoosed = 30
//    @Binding var startTime: Date
//    let volumeWater: [Int] = [200, 250, 300, 350, 400, 450, 500, 550, 600]
//    let timeIntervalList: [Int] = [30, 45, 60, 75, 90, 105, 120]
//    
//    var body: some View {
//        Form{
//            Section(header: Text("General settings")){
//                HStack{
//                    Text("Weight").frame(width: 100, alignment: .leading)
//                    TextField("", text: $weight).textFieldStyle(SuffixTextFieldStyle(suffix: "Kg"))
//                }
//            }
//            Section(header:Text("Water intake per drink")){
//                HStack{
//                    Text("Water Volume")
//                    Picker("", selection: $volumeWaterChoosed) {
//                        ForEach (volumeWater, id: \.self) {
//                            Text("\($0) ml").tag($0)
//                        }
//                    }
//                }
//            }
//            Section(header: Text("Time Settings")) {
//                HStack{
//                        Text("Start Time")
//                    DatePicker("", selection: $startTime, displayedComponents: .hourAndMinute)
//                    
//                }
//                HStack{
//                    Text("Interval")
//                    Picker("", selection: $intervalChoosed) {
//                        ForEach(timeIntervalList, id: \.self) {
//                            Text("\($0) minutes").tag($0)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(startTime: .constant(Date.now))
//    }
//}
