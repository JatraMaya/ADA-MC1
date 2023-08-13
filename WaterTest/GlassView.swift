//
//  GlassView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI

struct GlassView: View {

    // Number to control water animation (to scale the image properly)
    let valueForImageScaling = 2.6
    
    var currentWaterLevel: Double

    var body: some View {
        ZStack{
            Image("glass-empty")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            if currentWaterLevel >= valueForImageScaling {
                Image("water-full")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 219).padding(.top, -45)
            }else {
                Image("water")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 1, y: currentWaterLevel, anchor: .bottom)
                    .frame(width: 219).padding(.top, 210)
            }
            Image("reflection")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .padding(.leading, 130)
                .padding(.top, -180)
        }
    }
}
struct GlassView_Previews: PreviewProvider {
    static var previews: some View {
        GlassView(currentWaterLevel: 0.0)
    }
}
