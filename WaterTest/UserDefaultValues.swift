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
}
