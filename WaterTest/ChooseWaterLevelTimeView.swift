//
//  chooseTimeView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 10/04/23.
//

import SwiftUI
import UserNotifications

struct ChooseWaterLevelTimeView: View {
    @State var startTime = Date.now

    // Instantiate AppStorage with UserDefaultValues object
    @StateObject var userDefaultValues = UserDefaultValues()

    // Picker list value
    let pickerValue = PickerValues()

    var body: some View {
        VStack(spacing: 24){
            VStack{
                Image("time")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200).padding(.bottom, 20)
                Text("Let's log your water intake!")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 300)
                FormTimerAndWaterLevelView(waterVolumeChoosed: userDefaultValues.$volumeWaterChoosed,
                                           timerIntervalChoosed: userDefaultValues.$timerIntervalChoosed)
            }

            NavigationLink{
                DrinkTrackerView().navigationBarBackButtonHidden(true)

            }label: {
                Text("Start".capitalized)
                    .padding()
                    .frame(width: 320, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        } .padding(24)

        // Setup user permission for local notification
            .onAppear() {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ChooseWaterLevelTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseWaterLevelTimeView()
    }
}
