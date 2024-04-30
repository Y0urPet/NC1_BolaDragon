//
//  DragonBallTitle.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI

struct DragonBallTitle: View {
    @State var hexScaling: CGFloat = 1
    let starSize:CGFloat = 45
    
    var body: some View {
        
        ZStack {
            Circle().frame(width: 200).foregroundStyle(.orange.gradient).saturation(6.0)
            VStack(spacing:16) {
                HStack(spacing:16) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 30,height: 30)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 30,height: 30)
                }
                HStack(spacing:16) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 30,height: 30)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 30,height: 30)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 30,height: 30)
                }
                HStack(spacing:16) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 30,height: 30)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 30,height: 30)
                }
            }
            .offset(y:2)
        }
        .offset(y:-100)
//        .scaleEffect(hexScaling)
//        .onAppear{
//            // for scaling
//            let baseAnimate1 = Animation.linear(duration: 1)
//            let rep1 = baseAnimate1.repeatForever(autoreverses: true)
//            withAnimation(rep1) {
//                hexScaling = 0.9
//            }
//        }
    }
}

#Preview {
    DragonBallTitle()
}
