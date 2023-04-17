//
//  DrinkView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 11/04/23.
//

import SwiftUI

struct DrinkView: View {

    @AppStorage("name") var name = ""
    @AppStorage("currentWater") var currentWater = 0.0
    @AppStorage("target") var target:Int = 0
    @AppStorage("weight") var weight: String = ""
    @AppStorage("volumeWaterChoosed") var volumeWaterChoosed = 200
    @AppStorage("result") var result = 0.0
    @AppStorage("intervalChoosed") var intervalChoosed = 30
    @State var startTime: Date = Date.now
    @State var targetAchieved: Bool = false
    @State var showSetting: Bool = false
    @AppStorage("setupIsDone") var setupIsDone: Bool = false

    //Test value
    let volumeWater: [Int] = [200, 250, 300, 350, 400, 450, 500, 550, 600]
    let timeIntervalList: [Int] = [30, 45, 60, 75, 90, 105, 120]

    let fixedValue = 2.6

    @State var drinkTarget = 0
    let drink = 600

    // Generate basic haptic object
    let generator = UINotificationFeedbackGenerator()

    func drinkAction() {

        let x =  (Double(volumeWaterChoosed) / result) * fixedValue

        withAnimation{
            if (currentWater + x) < 2.6{
                currentWater += (Double(volumeWaterChoosed) / result) * fixedValue
                target += volumeWaterChoosed
            }else{
                currentWater = 2.6
                target = Int(result)
            }
        }
        generator.notificationOccurred(.success)

        if Int(target) == Int(result) {
            targetAchieved = true
        }
    }

    func undoDrinkAction() {

        let x =  (Double(volumeWaterChoosed) / result) * fixedValue
        
        withAnimation{
            if (currentWater - x ) >= 0.0{
                currentWater -= x
                target = target - volumeWaterChoosed
            }else{
                currentWater = 0.0
                target = 0
            }
        }
        generator.notificationOccurred(.success)
    }
    
    var body: some View {

            VStack{
                Button{
                    showSetting.toggle()
                }label: {
                    Image(systemName: "gearshape.fill")
                        .padding(.leading, 350)
                        .font(.system(size: 24))
                }
                Text("Drink Input")
                    .font(.title2)
                    .fontWeight(.bold)
                ZStack{
                    Image("glass-empty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    if currentWater >= fixedValue {
                        Image("water-full")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 219).padding(.top, -45)
                    }else {
                        Image("water")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(x: 1, y: currentWater, anchor: .bottom)
                            .frame(width: 219).padding(.top, 210)
                    }
                    Image("reflection")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding(.leading, 130)
                        .padding(.top, -180)
                }
                HStack{
                    Text("\(Int(target))/\(Int(result))ml")
                }.font(.title)
                    .fontWeight(.bold)
                HStack {
                    Button{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            drinkAction()
                        }
                    }label: {
                        Text("+ \(volumeWaterChoosed)")
                            .fontWeight(.bold)
                            .frame(width: 200, height: 45)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(4)
                    }
                    Button{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                            undoDrinkAction()
                        }
                    }label: {
                        Image(systemName: "arrowshape.turn.up.left")
                            .frame(width:100, height: 45)
                            .background(.white)
                            .foregroundColor((target <= 0) ? .black : .blue)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 2, x: 2, y: 3)
                    }.disabled(target <= 0)
                }.padding(.top, 30)
            }.sheet(isPresented: $showSetting, content: {
                Form{
                    Section(header: Text("General settings")){
                        HStack{
                            Text("Weight").frame(width: 100, alignment: .leading)
                            TextField("", text: $weight).textFieldStyle(SuffixTextFieldStyle(suffix: "Kg"))
                        }
                    }
                    Section(header:Text("Water intake per drink")){
                        HStack{
                            Text("Water Volume")
                            Picker("", selection: $volumeWaterChoosed) {
                                ForEach (volumeWater, id: \.self) {
                                    Text("\($0) ml").tag($0)
                                }
                            }
                        }
                    }
                    Section(header: Text("Time Settings")) {
                        HStack{
                                Text("Start Time")
                            DatePicker("", selection: $startTime, displayedComponents: .hourAndMinute)

                        }
                        HStack{
                            Text("Interval")
                            Picker("", selection: $intervalChoosed) {
                                ForEach(timeIntervalList, id: \.self) {
                                    Text("\($0) minutes").tag($0)
                                }
                            }
                        }
                    }
                }
            })

            .alert(isPresented: $targetAchieved) { () -> Alert in
                Alert(title: Text("Congratulation \(name)!"), message: Text("You've completed today's water intake target"), dismissButton: .default(Text("Done")))
            }
            .onAppear{
                setupIsDone = true
                IntervalSetup()
            }
        }
        
//    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
//        DrinkView(startTime: .constant(Date.now))
    }
}

extension DrinkView {

    // function to convert minutes interval to second unit
    func getIntervalInSeconds() -> Int {
        return intervalChoosed * 60
    }

    // function to setup notification
    func IntervalSetup() {

        let intervalChoosedDouble = Double(getIntervalInSeconds())
        let content = UNMutableNotificationContent()
        content.title = "Time to drink"
        content.subtitle = "It's time to hydrate your body"

        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: intervalChoosedDouble, repeats: true)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        // if the startTime value equal to the time NOW
        if startTime == .now {
            UNUserNotificationCenter.current().add(request)

            // Remove all pending notification when daily intake target achieved
            if targetAchieved {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }

    }
}

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

