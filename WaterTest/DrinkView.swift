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
    @AppStorage("setupIsDone") var setupIsDone: Bool = false

    @State var goalAchieved: Bool = false
    @State var showCongartulateMessage: Bool = false
    @State var showFailedMessage: Bool = false

    // State realted to time
    @State var isTimerRunning: Bool = false
    @State var isNextDay: Bool = false
    @State var startTime: Date = Date.now
    @State var timeTracker: Date = Date.now
    @State var showSetting: Bool = false

    // For timer purpose
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    // Value for animation purpose on sheet settings
    @State var pulseEffect = 1.0

    // Picker list for water volume and timeInterval
    let volumeWater: [Int] = [200, 250, 300, 350, 400, 450, 500, 550, 600]
    let timeIntervalList: [Int] = [30, 45, 60, 75, 90, 105, 120]

    // Magic number to control water animation (to scale the image properly)
    let fixedValue = 2.6

    // Instantiate basic haptic object
    let generator = UINotificationFeedbackGenerator()

    var body: some View {
        VStack{
            Button{
                showSetting.toggle()
            }label: {
                Image(systemName: "gearshape.fill")
                    .padding(.leading, 300)
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
                .alert(isPresented: $showCongartulateMessage) {
                    Alert(title: Text("Congratulation \(name)!"), message: Text("You've completed today's water intake target. Let's try to achieve the same result for tomorrow"), dismissButton: .default(Text("Done"), action: {
                        target = 0
                        currentWater = 0.0
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    }))
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
                }
                .alert(isPresented: $showFailedMessage) {
                    Alert(title: Text("Too bad"), message: Text("You failed to achieve your target today, fortunately there is always tomorrow"), dismissButton: .default(Text("Done"), action: {

                        target = 0
                        currentWater = 0.0
                        startTime = Date.now
                        timeTracker = Date.now
                        NotificationSetup()
                    }))
                }
                .disabled(target <= 0)
            }.padding(.top, 30)
        }

        // Running timer with on receive
        .onReceive(timer){
            _ in
            timeTracker += 1

            // Track if it's already 24 hours since the last time the user open the app
            if (Int(timeTracker.timeIntervalSince1970) - Int(startTime.timeIntervalSince1970) >= (60 * 60 * 24)) {
                if Int(target) < Int(result) {
                    showFailedMessage = true
                }

                startTime = Date.now
                timeTracker = Date.now
                NotificationSetup()
            }
        }
        .onAppear{

            // setup onboarding as done
            setupIsDone = true
            NotificationSetup()
        }
        .sheet(isPresented: $showSetting, onDismiss: {
            calculate()
        },content: {
            Form{
                Section(header: Text("General settings")){
                    HStack{
                        Text("Weight").frame(width: 100, alignment: .leading)
                        TextField("", text: $weight).textFieldStyle(SuffixTextFieldStyle(suffix: "Kg")).keyboardType(.numberPad)
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
                        Text("Reminder Interval")
                        Picker("", selection: $intervalChoosed) {
                            ForEach(timeIntervalList, id: \.self) {
                                Text("\($0) minutes").tag($0)
                            }
                        }
                    }
                }
            }.scrollContentBackground(.hidden)
                .frame(height: 400)
            VStack{
                Image(systemName: "chevron.compact.down").font(.system(size: 30))
                Image(systemName: "chevron.compact.down").font(.system(size: 25))
            }
            .opacity(pulseEffect)
            .onAppear{
                withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    pulseEffect = 0.3
                }
            }.presentationDetents([.medium])
            Text("Swipe down to close").padding(.top, 10)
        }
        )



    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
    }
}



// MARK: Collection of functions

extension DrinkView {

    func calculate() {

        let weightInt = Int(weight) ?? 0

        if weightInt <= 10 {
            result = Double(weightInt) * 100
        }else if weightInt <= 20 {
            result = (1000 + Double(weightInt) * 50)
        }else {
            result = 1500 + Double(weightInt) * 20
        }
    }

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
            goalAchieved = true
            showCongartulateMessage = true
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

    func getIntervalInSeconds() -> Int {
        return intervalChoosed * 60
    }

    func NotificationSetup() {

        // Randomize the notification content
        let notificationTitleLists: [String] = ["Stay Hydrated",
                                                "Drink Up!",
                                                "H20 Check-in",
                                                "Water Reminder",
                                                "Hydration Alert"]
        let notificationSubtitleLists: [String] = ["Don't forget to drink water throughout the day!",
                                                   "Time to drink some water and stay hydrated",
                                                   "How's your water intake today? Keep drinking!",
                                                   "Take a break and drink some water!",
                                                   "It's hydrating time!"]
        let randomIntforNotification = Int.random(in: 1..<notificationTitleLists.count)


        let intervalChoosedDouble = Double(getIntervalInSeconds())
        let content = UNMutableNotificationContent()
        content.title = notificationTitleLists[randomIntforNotification]
        content.subtitle = notificationSubtitleLists[randomIntforNotification]

        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: intervalChoosedDouble, repeats: true)

        let request = UNNotificationRequest(identifier: "drink notif", content: content, trigger: trigger)

        if !goalAchieved {
            UNUserNotificationCenter.current().add(request)
        }
    }

    func is24Hour() -> Bool {
        return (Int(startTime.timeIntervalSince1970) - Int(timeTracker.timeIntervalSince1970) >= 86400)
    }
}
