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
            VStack(spacing: 22){
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                Text("Welcome!")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                Text("Lorem ipsum dolor sit amet,  consectetur adipiscingelit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                NavigationLink {
                    DataView()
                }label: {
                    Text("Start".capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 130.0, height: 40.0)
                        .background(.blue
                        )
                        .cornerRadius(10)
                        
                        
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
