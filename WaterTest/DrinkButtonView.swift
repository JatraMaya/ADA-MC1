//
//  DrinkButtonView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI

struct DrinkButtonView: View {
    var volumeWaterChooses: Int
    var body: some View {
        Text("+ \(volumeWaterChooses)")
            .fontWeight(.bold)
            .frame(width: 200, height: 45)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(4)
    }
}

struct DrinkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkButtonView(volumeWaterChooses: 200)
    }
}
