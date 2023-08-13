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
                        Text("Welcome to Hybit, your personal water tracker! Let's get started by setting up your account.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 360)
                            .padding(.bottom, 50)
                    }

                    NavigationLink {
                        UserDataInputView()
                    }label: {
                        Text("Start".capitalized)
                            .font(.headline)
                            .padding()
                            .frame(width: 150, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
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
