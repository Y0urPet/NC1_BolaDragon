//
//  DragonBallTitle.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI

struct DragonBallTitle: View {
    @State var hexScaling: CGFloat = 1
    @State var hexDegree: Double = 0
    
    var body: some View {
        
        ZStack {
            Image("BolaDragonIcon")
                .resizable()
                .frame(width: 200,height: 200)
                .scaleEffect(hexScaling)
                .onAppear{
                    // for scaling
                    let baseAnimate1 = Animation.linear(duration: 1)
                    let rep1 = baseAnimate1.repeatForever(autoreverses: true)
                    withAnimation(rep1) {
                        hexScaling = 0.9
                    }
            }
        }
    }
}

#Preview {
    DragonBallTitle()
}
