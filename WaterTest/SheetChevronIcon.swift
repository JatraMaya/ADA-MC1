//
//  SheetChevronIcon.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/08/23.
//

import SwiftUI

struct SheetChevronIcon: View {
    
    // Value for animation purpose on sheet settings
    @State var pulseEffect = 1.0
    
    var body: some View {
        VStack{
            VStack{
                Image(systemName: "chevron.compact.down").font(.system(size: 30))
                Image(systemName: "chevron.compact.down").font(.system(size: 25))
            }
            .opacity(pulseEffect)
            .onAppear{
                withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                    pulseEffect = 0.3
                }
            }.presentationDetents([.medium])
            Text("Swipe down to close").padding(.top, 10)
        }
    }
}

struct SheetChevronIcon_Previews: PreviewProvider {
    static var previews: some View {
        SheetChevronIcon()
    }
}
