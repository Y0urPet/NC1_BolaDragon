//
//  Achievement.swift
//  DragonBall
//
//  Created by Stefan Agusto Hutapea on 28/04/24.
//

import SwiftUI

struct Achievement: View {
    
    var body: some View {
        VStack {
            // Trophy Image
            ZStack {
                Circle()
                    .fill(Color(hex: "F6F4EA"))
                    .frame(width: 190, height: 190)
                Image("thropy")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 147, height: 135)
            }
            .padding(.top, 125)
                
            
            
            // Dragon Ball Assets
            GeometryReader { geometry in
                ZStack {
                    ForEach(0..<7) { index in
                        let angle = Double(index) / Double(7) * 2 * Double.pi
                        let radius = min(geometry.size.width, geometry.size.height) * 0.35
                        let x = geometry.size.width / 2 + CGFloat(radius * cos(angle))
                        let y = geometry.size.height / 2 + CGFloat(radius * sin(angle))
                        
                        Image("ball\(index + 1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .offset(x: x - 50, y: y - 70)
                    }
                }
            }
            .padding(.top, 30)
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)){
                }
            })
            
            Spacer()
        }
        .padding()
        .background(Color(hex: "F1E7BA"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Achievement_Preview: PreviewProvider {
    static var previews: some View {
        Achievement()
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
