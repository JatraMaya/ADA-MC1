//
//  DrinkView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 11/04/23.
//

import SwiftUI

struct DrinkView: View {
    @AppStorage("currentWater") var currentWater = 0.0
    @AppStorage("target") var target:Int = 0
    @AppStorage("weight") var weight: String = ""
    @AppStorage("volumeWaterChoosed") var volumeWaterChoosed = 200
    @AppStorage("result") var result = 0.0

    let fixedValue = 2.6

    @State var drinkTarget = 0
    let drink = 600

    // Generate basic haptic object
    let generator = UINotificationFeedbackGenerator()

    func drinkAction() {

        withAnimation{
            currentWater += (Double(volumeWaterChoosed) / result) * fixedValue
            target += volumeWaterChoosed}
        generator.notificationOccurred(.success)
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
        NavigationStack{
            VStack{
                NavigationLink {
                    SettingsView()
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
            }
//            VStack{
//                Button("Schedule Notification") {
//                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                        if success {
//                            print("All set!")
//                        } else if let error = error {
//                            print(error.localizedDescription)
//                        }
//                    }
//                }
//                Button("Schedule Notification") {
//                    let content = UNMutableNotificationContent()
//                    content.title = "Feed the cat"
//                    content.subtitle = "It looks hungry"
//                    content.sound = UNNotificationSound.default
//
//                    // show this notification five seconds from now
//                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//
//                    // choose a random identifier
//                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//                    // add our notification request
//                    UNUserNotificationCenter.current().add(request)
//                }
//            }
        }
        
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
    }
}
