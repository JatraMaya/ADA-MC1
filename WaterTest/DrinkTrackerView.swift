//
//  DrinkView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 11/04/23.
//

import SwiftUI

struct DrinkTrackerView: View {

    // Instantiate AppStorage with UserDefaultValues object
    @StateObject var userDefaultValues = UserDefaultValues()

    @State var isDrinkGoalAchieved: Bool = false
    @State var isCongartulateMessageShowed: Bool = false
    @State var isFailedMessageShowed: Bool = false

    // Assigning state for notification timer
    @State var isTimerRunning: Bool = false
    @State var isNextDay: Bool = false
    @State var isSettingShowed: Bool = false
    @State var notificationStartTime: Date = Date.now
    @State var timeTrackerStartTime: Date = Date.now

    // Instatiate timer object to control notification timing
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    // Instantiate basic haptic object
    let generator = UINotificationFeedbackGenerator()

    var body: some View {
        VStack{
            Button{
                isSettingShowed.toggle()
            }label: {
                Image(systemName: "gearshape.fill")
                    .padding(.leading, 300)
                    .font(.system(size: 24))
            }
            Text("Drink Input")
                .font(.title2)
                .fontWeight(.bold)
            GlassView(currentWaterLevel: userDefaultValues.currentWaterLevel)
            HStack{
                Text("\(Int(userDefaultValues.waterIntakeTarget))/\(Int(userDefaultValues.result))ml")
            }.font(.title)
                .fontWeight(.bold)
            HStack {
                Button{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) // 0.01 value to setup DispatchQueue run in milisecond
                    {
                        drinkButtonIsTapped()
                    }
                }label: {
                    DrinkButtonView(volumeWaterChooses: userDefaultValues.volumeWaterChoosed)
                }
                .alert(isPresented: $isCongartulateMessageShowed) {
                    Alert(title: Text("Congratulation \(userDefaultValues.username)!"), message: Text("You've completed today's water intake target. Let's try to achieve the same result for tomorrow"), dismissButton: .default(Text("Done"), action: {
                        userDefaultValues.updateWaterIntakeTarget(withValue: 0)
                        userDefaultValues.updatecurrentWaterLevel(withValue: 0.0)
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    }))
                }
                Button{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                        undoDrinkButtonIsTapped()
                    }
                }label: {
                    UndoDrinkButtonView(waterIntakeTarget: userDefaultValues.waterIntakeTarget)
                }
                .alert(isPresented: $isFailedMessageShowed) {
                    Alert(title: Text("Too bad"), message: Text("You failed to achieve your target today, fortunately there is always tomorrow"), dismissButton: .default(Text("Done"), action: {
                        userDefaultValues.updateWaterIntakeTarget(withValue: 0)
                        userDefaultValues.updatecurrentWaterLevel(withValue: 0.0)
                        notificationStartTime = Date.now
                        timeTrackerStartTime = Date.now
                        NotificationSetup()
                    }))
                }
                .disabled(userDefaultValues.waterIntakeTarget <= 0)
            }.padding(.top, 30)
        }

        // Running timer with on receive
        .onReceive(timer){
            _ in
            activateTimer()
        }
        .onAppear{
            // setup onboarding as done
            userDefaultValues.changeSetupStatus(withStatus: true)
            NotificationSetup()
        }
        .sheet(isPresented: $isSettingShowed, onDismiss: {
            userDefaultValues.updateResult(withValue: calculateWaterNeeds(userWeight: userDefaultValues.userWeight)) 
        },content: {
            SettingsFormView(userWeight: userDefaultValues.$userWeight, timerIntervalChoosed: userDefaultValues.$timerIntervalChoosed, volumeWaterChoosed: userDefaultValues.$volumeWaterChoosed)
                .frame(height: 400)
            SheetChevronIcon()
        }
        )
    }
}

struct DrinkTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkTrackerView()
    }
}
