//
//  ChooseDrinkView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 03/04/23.
//

import SwiftUI

struct ChooseDrinkView: View {
    @State var drinkVolume = ""
    
    var body: some View {
        VStack(){
            Text("Fill in your volume per Drink").font(.largeTitle).multilineTextAlignment(.center).fontWeight(.bold)
            HStack(alignment: .bottom, spacing: 45){
                VStack{
                    Image("glass")
                        .resizable().scaledToFit().frame(height: 100)
                    Text("200 ml")
                }
                VStack{
                    Image("bottle")
                        .resizable().scaledToFit().frame(height: 150)
                    Text("600ml")
                }
                VStack{
                    Image("big-bottle").resizable().scaledToFit().frame(height: 150)
                    Text("1500ml")
                }
                
            }
            Form{
                TextField("Choose your drinking volume", text: $drinkVolume).keyboardType(.numberPad)
            }.padding(.bottom, 350)
                .scrollContentBackground(.hidden)
        }
    }
    
}

struct ChooseDrinkView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseDrinkView()
    }
}
