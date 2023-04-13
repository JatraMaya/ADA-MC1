//
//  chooseTimeView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 10/04/23.
//

import SwiftUI

struct chooseTimeView: View {
    @State var startTime = Date.now
    let volumeWater: [Int] = [200, 250, 300, 350, 400, 450, 500, 550, 600]
    @AppStorage("volumeWaterChoosed") var volumeWaterChoosed = 200
    
    var body: some View {
        VStack(spacing: 24){
            VStack(spacing : 8) {
                Text("Set Time")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Lorem ipsum dolor sit amet,  consectetur adipiscingelit, sed do eiusmod tempor")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15))
                    .frame(width: 300)
            }
            VStack{
                Image("time")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                Form{
                    HStack{
                        Text("Water Volume")
                        Picker("", selection: $volumeWaterChoosed) {
                            ForEach (volumeWater, id: \.self) {
                                Text("\($0)").tag($0)
                            }
                        }
                    }
                    HStack{
                        Text("Start Time")
                        DatePicker("", selection: $startTime, displayedComponents: .hourAndMinute)
                        
                        
                    }
                    HStack{
                        Text("Interval")
                            
                    }
                    
                }.scrollContentBackground(.hidden)
                    .padding( -35)
                
            }
            
            NavigationLink{
                DrinkView()
            }label: {
                Text("Start".capitalized)
                    .padding()
                    .frame(width: 320, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(4)
            }
        } .padding(24)
    }
}

struct chooseTimeView_Previews: PreviewProvider {
    static var previews: some View {
        chooseTimeView()
    }
}
