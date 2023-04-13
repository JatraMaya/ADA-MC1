//
//  DrinkView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 11/04/23.
//

import SwiftUI

struct DrinkView: View {
    @State var currentWater = 0.0
    @State var target:Int = 0
    @AppStorage("weight") var weight: String = ""
    @AppStorage("volumeWaterChoosed") var volumeWaterChoosed = 200
    @AppStorage("result") var result = 0.0
    let fixedValue = 2.6

    @State var drinkTarget = 0 
    let drink = 600
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink {
                    SettingsView()
                }label: {
                    Image(systemName: "gearshape.fill")
                }.padding(.leading, 350)
                    .font(.system(size: 24))
                Text("Drink Input")
                    .font(.title2)
                    .fontWeight(.bold)
                ZStack{
                    Image("glass-empty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    if currentWater >= fixedValue {
                        Image("water-full")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 219).padding(.top, -45)
                    }else {
                        Image("water")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(x: 1, y: currentWater, anchor: .bottom)
                            .frame(width: 219).padding(.top, 210)
                    }
                    Image("reflection")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding(.leading, 130)
                        .padding(.top, -180)
                }
                HStack{
                    Text("\(Int(max(target, 0)))/\(Int(result))ml")
                }.font(.title)
                .fontWeight(.bold)
                HStack {
                    Button("+\(volumeWaterChoosed)"){
                        withAnimation{
                            currentWater += (Double(volumeWaterChoosed) / result) * fixedValue
                            target += volumeWaterChoosed
                        }
                    }.frame(width: 200, height: 45)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(4)
                    Button{
                        withAnimation{
                            currentWater -= (Double(volumeWaterChoosed) / result) * fixedValue
                            target -= volumeWaterChoosed}
                    }label: {
                        Image(systemName: "arrowshape.turn.up.left")
                    }.frame(width:100, height: 45)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 2, y: 3).disabled(target == 0)
                }.padding(.top, 30)
            }
        }
        
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
    }
}
