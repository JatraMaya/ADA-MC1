//
//  UndoDrinkButtonView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI

struct UndoDrinkButtonView: View {
    var waterIntakeTarget: Int
    var body: some View {
        Image(systemName: "arrowshape.turn.up.left")
            .frame(width:100, height: 45)
            .background(.white)
            .foregroundColor((waterIntakeTarget <= 0) ? .black : .blue)
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 2, y: 3)
    }
}

struct UndoDrinkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        UndoDrinkButtonView(waterIntakeTarget: 100)
    }
}
