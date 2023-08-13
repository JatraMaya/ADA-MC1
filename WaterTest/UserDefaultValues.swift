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


/// Struct to contain picker values for VolumeWater and timeInterval selection
struct PickerValue{
    let volumeWaterList: [Int] = [200, 250, 300, 350, 400, 450, 500, 550, 600]
    let timeIntervalList: [Int] = [30, 45, 60, 75, 90, 105, 120]
}
