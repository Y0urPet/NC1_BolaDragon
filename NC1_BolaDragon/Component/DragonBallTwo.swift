//
//  DragonBallTwo.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI

struct DragonBallTwo: View {
    @State var hexScaling: CGFloat = 1

    @State var hexDegree: Double = 0
    
    var body: some View {
        Image(systemName: "circle.hexagongrid")
            .resizable()
            .scaleEffect(hexScaling)
            .rotationEffect(.degrees(hexDegree))
            .onAppear{
                // for degrees
                let baseAnimate = Animation.linear(duration: 50)
                let rep = baseAnimate.repeatForever(autoreverses: false)
                withAnimation(rep) {
                    hexDegree += 360
                }
                
                // for scaling
                let baseAnimate1 = Animation.linear(duration: 1)
                let rep1 = baseAnimate1.repeatForever(autoreverses: true)
                withAnimation(rep1) {
                    hexScaling = 1.2
                }
            }
            .foregroundStyle(.prime)
            .frame(width: 125,height: 125)
    }
}

#Preview {
    DragonBallTwo()
}
