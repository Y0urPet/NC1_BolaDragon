//
//  SplashBall.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 29/04/24.
//

import SwiftUI

struct SplashBall: View {
    @State var opacitis1 = 0.0
    @State var opacitis2 = 0.0
    @State var opacitis3 = 0.0
    @State var opacitis4 = 0.0
    @State var opacitis5 = 0.0
    @State var opacitis6 = 0.0
    @State var opacitis7 = 0.0
    
    var body: some View {
        VStack {
            HStack{
                BallOne()
                    .opacity(opacitis1)
                BallTwo()
                    .opacity(opacitis2)
                BallThree()
                    .opacity(opacitis3)
                BallFourth()
                    .opacity(opacitis4)
            }
            HStack{
                BallFifth()
                    .opacity(opacitis5)
                BallSixth()
                    .opacity(opacitis6)
                BallSeventh()
                    .opacity(opacitis7)
            }
        }
        .offset(y:10)
        .onAppear{
//            withAnimation(.easeOut(duration: 1).delay(2)) {
//                scaleAmount = 0.5
//                
//            }
//            let baseAnimate = Animation.linear(duration: 0.6)
//            let rep = baseAnimate.repeatForever(autoreverses: true)
            
            withAnimation(.easeOut(duration: 0.5)) {
                opacitis1 = 1.0
            }
            withAnimation(.easeOut(duration: 0.5).delay(1)) {
                opacitis2 = 1.0
            }
            withAnimation(.easeOut(duration: 0.5).delay(2)) {
                opacitis3 = 1.0
            }
            withAnimation(.easeOut(duration: 0.5).delay(3)) {
                opacitis4 = 1.0
            }
            withAnimation(.easeOut(duration: 0.5).delay(4)) {
                opacitis5 = 1.0
            }
            withAnimation(.easeOut(duration: 0.5).delay(5)) {
                opacitis6 = 1.0
            }
            withAnimation(.easeOut(duration: 0.5).delay(6)) {
                opacitis7 = 1.0
            }
        }
    }
}

struct BallOne: View {
    let totalDuration = 3.0
    var body: some View {
        ZStack {
            Circle().frame(width: 70).foregroundStyle(.orange.gradient).saturation(6.0)
            Image(systemName: "star.fill")
                .resizable()
                .foregroundStyle(.yellow)
                .frame(width: 20,height: 20)
                .shadow(radius: 1)
        }
//        .keyframeAnimator(initialValue: AnimationProperties(), repeating: true) { content, value in
//            content
//                .offset(x:value.yTranslation,y: value.yTranslation)
//        } keyframes: { _ in
//            KeyframeTrack(\.yTranslation) {
//                CubicKeyframe(0, duration: totalDuration * 0.1)
//                CubicKeyframe(-350, duration: totalDuration * 2)
//                CubicKeyframe(0, duration: totalDuration * 2)
//            }
//        }
    }
}

struct BallTwo: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 70).foregroundStyle(.orange.gradient).saturation(6.0)
            VStack(spacing:0) {
                HStack(spacing:0) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 20,height: 20)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 20,height: 20).hidden()
                }
                HStack(spacing:0) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 20,height: 20).hidden()
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                        .frame(width: 20,height: 20)
                }
                
            }
        }
        
    }
}

struct BallThree: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 70).foregroundStyle(.orange.gradient).saturation(6.0)
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 15,height: 15)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 15,height: 15)
                }
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundStyle(.yellow)
                .frame(width: 15,height: 15)
            }.offset(y:2)
        }
    }
}

struct BallFourth: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 70).foregroundStyle(.orange.gradient).saturation(6.0)
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 15,height: 15)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 15,height: 15)
                }
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 15,height: 15)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 15,height: 15)
                }
                
            }
//            .offset(y:2)
        }
    }
}

struct BallFifth: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 70).foregroundStyle(.orange.gradient).saturation(6.0)
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                }
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                }
                
            }
            .offset(y:2)
        }
    }
}

struct BallSixth: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 70).foregroundStyle(.orange.gradient).saturation(6.0)
            VStack {
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                }
                HStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                }
            }
        }
    }
}

struct BallSeventh: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 70).foregroundStyle(.orange.gradient).saturation(6.0)
            VStack(spacing:5) {
                HStack(spacing:5) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                }
                HStack(spacing:5) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundStyle(.yellow)
                    .frame(width: 12,height: 12)
                }
            }.offset(y:2)
        }
    }
}



#Preview {
    BallOne()
}
