//
//  DrinkView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 11/04/23.
//

import SwiftUI

struct DrinkView: View {
    @State var currentWater = 0.0
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink {
                    SettingsView()
                }label: {
                    Image(systemName: "gearshape.fill")
                }.padding(.leading, 350).padding(.top, -80)
                Text("Drink Input")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ZStack{
                    Image("glass-empty")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                    if currentWater >= 2 {
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
                    Text(String(format: "%d", currentWater))
                    Text("/")
                    Text("2000ml")
                }.fontWeight(.bold)
                HStack {
                    Button("Drink"){
                        withAnimation{
                            currentWater += 0.1}
                    }.frame(width: 200, height: 45)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                    Button{
                        withAnimation{
                            currentWater -= 0.1}
                    }label: {
                        Image(systemName: "arrowshape.turn.up.left")
                    }.frame(width:100, height: 45)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 2, x: 2, y: 3)
                    
                }
            }
        }
        
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView()
    }
}
