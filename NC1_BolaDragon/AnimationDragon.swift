//
//  AnimationDragon.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 29/04/24.
//

import SwiftUI

struct AnimationDragon: View {
    @State var scalingCheck:CGFloat = 10
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).ignoresSafeArea().blur(radius: 20)
            PathAnimationExample()
            NavigationLink(destination: MainMenu()) {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .padding(scalingCheck)
                    .background(.orange.gradient).saturation(3.0)
                    .clipShape(Circle())
                    .offset(y:300)
                    .onAppear {
                        let baseAnimate = Animation.linear(duration: 0.6)
                        let rep = baseAnimate.repeatForever(autoreverses: true)
                        withAnimation(rep) {
                            scalingCheck = 15
                        }
                    }
            }
        }
        
    }
}

struct DevTechieShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            
            path.move(to: CGPoint(x: rect.minX+120, y: rect.maxY+110))
//            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            
            path.addCurve(
                to: CGPoint(x: rect.midX+100, y: rect.midY-10),
                control1: CGPoint(x: rect.minX+100, y: rect.minY+160),
                control2: CGPoint(x: rect.midX+50, y: rect.minY+130)
            )
            
            path.addCurve(
                to: CGPoint(x: rect.midX, y: rect.midY-130),
                control1: CGPoint(x: rect.minX+300, y: rect.minY),
                control2: CGPoint(x: rect.midX+100, y: rect.minY-30)
            )
            
            path.addCurve(
                to: CGPoint(x: rect.midX+20, y: rect.midY-220),
                control1: CGPoint(x: rect.minX-50, y: rect.minY-40),
                control2: CGPoint(x: rect.midX-100, y: rect.minY-90)
            )
            path.addCurve(
                to: CGPoint(x: rect.maxX-100, y: rect.maxY-400),
                control1: CGPoint(x: rect.maxX+190, y: rect.maxY-410),
                control2: CGPoint(x: rect.maxX+90, y: rect.maxY-500)
            )
            path.addCurve(
                to: CGPoint(x: rect.maxX-100, y: rect.maxY-430),
                control1: CGPoint(x: rect.maxX-310, y: rect.maxY-290),
                control2: CGPoint(x: rect.maxX-310, y: rect.maxY-500)
            )
            path.addCurve(
                to: CGPoint(x: rect.maxX+50, y: rect.maxY-500),
                control1: CGPoint(x: rect.maxX, y: rect.maxY-400),
                control2: CGPoint(x: rect.maxX, y: rect.maxY-400)
            )
            path.addCurve(
                to: CGPoint(x: rect.maxX, y: rect.maxY-600),
                control1: CGPoint(x: rect.maxX+90, y: rect.maxY-600),
                control2: CGPoint(x: rect.maxX, y: rect.maxY-600)
            )
            path.addCurve(
                to: CGPoint(x: rect.maxX-100, y: rect.maxY-550),
                control1: CGPoint(x: rect.maxX-100, y: rect.maxY-600),
                control2: CGPoint(x: rect.maxX-100, y: rect.maxY-600)
                
            )
//            path.addRoundedRect(in: CGRect(x: 105, y: -300, width: 30, height: 10), cornerRadii: RectangleCornerRadii(topLeading: 0,bottomLeading: 0,bottomTrailing: 0,topTrailing: 10))
//            path.addRoundedRect(in: CGRect(x: 70, y: -300, width: 30, height: 10), cornerRadii: RectangleCornerRadii(topLeading: 10,bottomLeading: 0,bottomTrailing: 10,topTrailing: 10))
//            path.addRoundedRect(in: CGRect(x: 87, y: -260, width: 30, height: 80), cornerRadii: RectangleCornerRadii(topLeading: 0,bottomLeading: 10,bottomTrailing: 10,topTrailing: 0))
            
            
            
//            path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control1: CGPoint(x: rect.midX, y: rect.maxY), control2: CGPoint(x: rect.minX, y: rect.maxY))
//
//            path.addCurve(to: CGPoint(x: rect.minX, y: rect.maxY), control1: CGPoint(x: rect.midX, y: rect.midY), control2: CGPoint(x: rect.midX, y: rect.maxY))
//
//            path.addLine(to: CGPoint(x: rect.maxX * 0.75, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.maxX * 0.75, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }
    }
}

struct PathAnimationExample: View {
    @State private var pathProgress = 0.0
    
    @State private var colorNum = Color.forestGreen
    
    @State private var auraDragon = Color.yellow
    
    @State private var showHead = false
    
    var body: some View {
        ZStack {
            DevTechieShape()
                .trim(from: 0.0, to: pathProgress)
                .stroke(.dragonColorNeck, lineWidth: 65)
                .frame(width: 200, height: 200)
                .shadow(color:auraDragon, radius: 50)
                .animation(.linear(duration: 1).delay(7), value: pathProgress)
                .onAppear {
                    let baseAnimate = Animation.linear(duration: 0.6)
                    let rep = baseAnimate.repeatForever(autoreverses: true)
                    
                    withAnimation(rep) {
                        auraDragon = Color.orange
                    }
                    withAnimation(Animation.linear(duration: 0.1)) {
                        pathProgress = 1.0
                    }
                    
                    withAnimation(Animation.linear(duration: 0.1).delay(8)) {
                        showHead = true
                    }
                }
                .offset(y:210)
            DevTechieShape()
                .trim(from: 0.0, to: pathProgress)
                .stroke(.dragonBody, lineWidth: 45)
                .frame(width: 200, height: 200)
                .shadow( radius: 50)
                .animation(.linear(duration: 1).delay(7), value: pathProgress)
                .onAppear {
//                    let baseAnimate = Animation.linear(duration: 0.6)
                    
//                    withAnimation(rep) {
//                        colorNum = Color.orange.gradient
//                    }
                    withAnimation(Animation.linear(duration: 0.1)) {
                        pathProgress = 1.0
                    }
                    
                    withAnimation(Animation.linear(duration: 0.1).delay(8)) {
                        showHead = true
                    }
                }
                .offset(y:210)
            Image("dragonHead")
                .resizable()
//                .renderingMode(.template)
                .frame(width: 200,height: 200)
//                .foregroundStyle(colorNum)
                .shadow(radius: 10)
                .opacity(showHead ? 1 : 0)
                .offset(y:-240)
            
            BallAnimation()
//            Circle().frame(width: 130).offset(x:120,y:-180).foregroundStyle(.orange)
//            Slider(value: $pathProgress, in: 0.0...1.0)
//                .padding()
//                .onChange(of: pathProgress) { oldValue, newValue in
//                    withAnimation {
//                        let baseAnimate = Animation.linear(duration: 0.8)
//                        let rep = baseAnimate.repeatForever(autoreverses: true)
//                        
//                        withAnimation(baseAnimate) {
//                            if pathProgress == 1.0 {
//                                showHead = true
//                            } else {
//                                showHead = false
//                            }
//                        }
//                    }
//                    
//                }
        }
    }
}

#Preview {
    AnimationDragon()
}
