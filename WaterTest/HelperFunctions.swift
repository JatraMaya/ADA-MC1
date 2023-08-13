//
//  HelperFunctions.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import Foundation

/// Function to control the disable state of calculate button
/// - Returns: return bolean value based on name and weight value is empty
func controlCalculateButtonState() -> Bool {

    let userDefaultValues = UserDefaultValues()

    return userDefaultValues.username.isEmpty
    || userDefaultValues.userWeight.isEmpty
}


/// Function to calculate user daily water intake needs, handle appstorage value directly, return void
/// - Returns: Void,
func calculateWaterNeeds() {

    let userDefaultValues = UserDefaultValues()

    let weightInt = Int(userDefaultValues.userWeight) ?? 0

    // Multiplier value to convert ounce to Ml
    let for10KgOrBelow = 100
    let for20KgOrBelow = 50
    let forOver20Kg = 20

    // Formula number based on health recommendation to calculate daily water intake
    let weightIs20KgOrLower = 1000
    let weightIsOver20Kg = 1500

    if weightInt <= 10 {
        userDefaultValues.result = Double(weightInt) * Double(for10KgOrBelow)
    }else if weightInt <= 20 {
        userDefaultValues.result = (Double(weightIs20KgOrLower) + Double(weightInt) * Double(for20KgOrBelow))
    }else {
        userDefaultValues.result = Double(weightIsOver20Kg) + Double(weightInt) * Double(forOver20Kg)
    }
}


    /// Function to calculate user daily water intake needs, return result value in Double
    /// - Parameter userWeight: Weight of a user in Kg in string format
    /// - Returns: user daily water needs in Ml
    func calculateWaterNeeds(userWeight: String) -> Double {

        let weightInt = Int(userWeight) ?? 0

        // Multiplier value to convert ounce to Ml
        let for10KgOrBelow = 100
        let for20KgOrBelow = 50
        let forOver20Kg = 20

        // Formula number based on health recommendation to calculate daily water intake
        let weightIs20KgOrLower = 1000
        let weightIsOver20Kg = 1500

        var userWaterNeeds = 0.0

        if weightInt <= 10 {
           userWaterNeeds =  Double(weightInt) * Double(for10KgOrBelow)
        }else if weightInt <= 20 {
            userWaterNeeds = (Double(weightIs20KgOrLower) + Double(weightInt) * Double(for20KgOrBelow))
        }else {
            userWaterNeeds = Double(weightIsOver20Kg) + Double(weightInt) * Double(forOver20Kg)
        }
        return userWaterNeeds
    }
