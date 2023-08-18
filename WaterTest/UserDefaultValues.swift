//
//  UserDefaultValues.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI

/// Set AppStorage value in a single object to make code more readable
class UserDefaultValues: ObservableObject {
    @AppStorage("username") var username: String = ""
    @AppStorage("currentWater") var currentWaterLevel: Double = 0.0
    @AppStorage("waterIntakeTarget") var waterIntakeTarget: Int = 0
    @AppStorage("userWeight") var userWeight: String = ""
    @AppStorage("volumeWaterChoosed") var volumeWaterChoosed: Int = 200
    @AppStorage("result") var result: Double = 0.0
    @AppStorage("intervalChoosed") var timerIntervalChoosed: Int = 30
    @AppStorage("setupIsDone") var setupIsDone: Bool = false

    func updateUsername(withValue name: String) {
        self.username = name
    }

    func updatecurrentWaterLevel(withValue value: Double) {
        self.currentWaterLevel = value
    }

    func updateWaterIntakeTarget(withValue value: Int) {
        self.waterIntakeTarget = value
    }

    func addUserWeight(withWeight weight: String) {
        self.userWeight = weight
    }

    func updateVolumeWaterChoosed(withValue volumeWater: Int) {
        self.volumeWaterChoosed = volumeWater
    }

    func updateResult(withValue result: Double) {
        self.result = result
    }

    func updateTimeInterval(withTime time: Int) {
        self.timerIntervalChoosed = time
    }

    func changeSetupStatus(withStatus status: Bool) {
        self.setupIsDone = status
    }
}
