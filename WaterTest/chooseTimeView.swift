//
//  chooseTimeView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 10/04/23.
//

import SwiftUI
import UserNotifications

struct chooseTimeView: View {
    @State var startTime = Date.now

    @AppStorage("volumeWaterChoosed") var volumeWaterChoosed = 200
    @AppStorage("intervalChoosed") var intervalChoosed = 30

    // Picker list value
    let volumeWater: [Int] = [200, 250, 300, 350, 400, 450, 500, 550, 600]
    let timeIntervalList: [Int] = [30, 45, 60, 75, 90, 105, 120]

    @AppStorage("intervalReminder") var intervalReminder = 0
    
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
                Form{
                    Section(header: Text("volume per drink")){
                    HStack{
                            Text("Water Volume")
                            Picker("", selection: $volumeWaterChoosed) {
                                ForEach (volumeWater, id: \.self) {
                                    Text("\($0) ml").tag($0)
                                }
                            }
                        }
                    }
                    Section(header: Text("time to drink")) {
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
                }.frame(width: 400)
                .scrollContentBackground(.hidden)
            }

            NavigationLink{
                DrinkView().navigationBarBackButtonHidden(true)

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

struct chooseTimeView_Previews: PreviewProvider {
    static var previews: some View {
        chooseTimeView()
    }
}
