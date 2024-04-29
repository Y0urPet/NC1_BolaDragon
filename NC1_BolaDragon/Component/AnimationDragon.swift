//
//  AnimationDragon.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 29/04/24.
//

import SwiftUI

struct AnimationDragon: View {
    @State private var speed = 50.0
        @State private var isEditing = false
        @State private var lineWidthScaling: CGFloat = 0

        var body: some View {
            ZStack{
    //            Path { path in
    //                path.move(
    //                    to: CGPoint(x:UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height)
    //                )
    //                path.addLine(to: CGPoint(x: UIScreen.main.bounds.width/2, y: 0))
    //            }
    //            .stroke(lineWidth: 1.0)
                Rectangle()
                    .frame(width: 100, height: 100)
    //            .scaleEffect(lineWidthScaling)
                .offset(x: -130)
                .rotationEffect(.degrees(lineWidthScaling))
                .onAppear{
                    let baseAnimate = Animation.linear(duration: 0.6)
                    let rep = baseAnimate.repeatForever(autoreverses: true)
                    
                    withAnimation(rep) {
                        lineWidthScaling = 180
                    }
                }
                
    //            Slider(
    //                value: $speed,
    //                in: 0...100,
    //                onEditingChanged: { editing in
    //                    isEditing = editing
    //                }
    //            )
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
    @State private var pathProgress = 1.0
    
    @State private var colorNum = Color.green.gradient
    
    @State private var showHead = false
    
    var body: some View {
        ZStack {
            DevTechieShape()
                .trim(from: 0.0, to: pathProgress)
                .stroke(colorNum, lineWidth: 60)
                .frame(width: 200, height: 200)
                .shadow(radius: 50)
                .animation(.linear(duration: 1), value: pathProgress)
                .onAppear {
                    withAnimation {
                        let baseAnimate = Animation.linear(duration: 0.6)
                        let rep = baseAnimate.repeatForever(autoreverses: true)
                        
                        withAnimation(rep) {
                            colorNum = Color.orange.gradient
                        }
                    }
                    print($pathProgress)
                }
                .offset(y:210)
            Image("dragon2")
                .resizable()
                .renderingMode(.template)
                .frame(width: 200,height: 200)
                .foregroundStyle(colorNum)
                .shadow(radius: 10)
                .position(CGPoint(x: 200.0, y: 180.0))
                .opacity(showHead ? 1 : 0)
            Circle().frame(width: 130).offset(x:120,y:-180).foregroundStyle(.orange)
            Slider(value: $pathProgress, in: 0.0...1.0)
                .padding()
                .onChange(of: pathProgress) { oldValue, newValue in
                    withAnimation {
                        let baseAnimate = Animation.linear(duration: 0.8)
                        let rep = baseAnimate.repeatForever(autoreverses: true)
                        
                        withAnimation(baseAnimate) {
                            if pathProgress == 1.0 {
                                showHead = true
                            } else {
                                showHead = false
                            }
                        }
                    }
                    
                }
        }
    }
}

#Preview {
    PathAnimationExample()
}
