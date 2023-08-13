//
//  DrinkView + Extension.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI

extension DrinkTrackerView {

    /// Function to update waterIntakeTarget and waterIntakeLevel based on user action when button is tapped
    func drinkButtonIsTapped() {

        // Number to control water animation (to scale the image properly)
        let valueForImageScaling = 2.6

        let x =  (Double(userDefaultValues.volumeWaterChoosed) / userDefaultValues.result) * valueForImageScaling

        withAnimation{
            if (userDefaultValues.currentWaterLevel + x) < 2.6{
                userDefaultValues.currentWaterLevel += (Double(userDefaultValues.volumeWaterChoosed) / userDefaultValues.result) * valueForImageScaling
                userDefaultValues.waterIntakeTarget += userDefaultValues.volumeWaterChoosed
            }else{
                userDefaultValues.currentWaterLevel = 2.6
                userDefaultValues.waterIntakeTarget = Int(userDefaultValues.result)
            }
        }
        generator.notificationOccurred(.success)

        if Int(userDefaultValues.waterIntakeTarget) == Int(userDefaultValues.result) {
            isDrinkGoalAchieved = true
            isCongartulateMessageShowed = true
        }
    }

    /// Function to update waterIntakeTarget and waterIntakeLevel based on user action when button is tapped
    func undoDrinkButtonIsTapped() {

        // Number to control water animation (to scale the image properly)
        let valueForImageScaling = 2.6

        let x =  (Double(userDefaultValues.volumeWaterChoosed) / userDefaultValues.result) * valueForImageScaling

        withAnimation{
            if (userDefaultValues.currentWaterLevel - x ) >= 0.0{
                userDefaultValues.currentWaterLevel -= x
                userDefaultValues.waterIntakeTarget = userDefaultValues.waterIntakeTarget - userDefaultValues.volumeWaterChoosed
            }else{
                userDefaultValues.currentWaterLevel = 0.0
                userDefaultValues.waterIntakeTarget = 0
            }
        }
        generator.notificationOccurred(.success)
    }

    /// Function to convert time interval choosed by user into second
    func getIntervalInSeconds() -> Int {
        return userDefaultValues.timerIntervalChoosed * 60
    }


    /// Function to setup notification
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

        if !isDrinkGoalAchieved {
            UNUserNotificationCenter.current().add(request)
        }
    }

    func is24Hour() -> Bool {
        let secondsInADay = 86400
        return (Int(notificationStartTime.timeIntervalSince1970) - Int(timeTrackerStartTime.timeIntervalSince1970) >= secondsInADay)
    }
}

