//
//  WelcomeView.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 02/04/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 24){
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                VStack(spacing: 4){
                    Text("Welcome!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Lorem ipsum dolor sit amet,  consectetur adipiscingelit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)
                }
                NavigationLink {
                    DataView()
                }label: {
                    Text("Start".capitalized)
                        .padding()
                        .frame(width: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(4)
                    
                    
                }
            }
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
