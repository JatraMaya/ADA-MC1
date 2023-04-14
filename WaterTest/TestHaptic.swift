//
//  TestHaptic.swift
//  WaterTest
//
//  Created by Ahmad Fadly Iksan on 13/04/23.
//

import SwiftUI

struct TestHaptic: View {
    var body: some View {
        Button{

        }label: {
            Text("Haptic")
                .onTapGesture(perform: basicHaptic)
        }


    }
}

struct TestHaptic_Previews: PreviewProvider {
    static var previews: some View {
        TestHaptic()
    }
}
