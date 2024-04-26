//
//  MainMenu.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            CubeBackground()
            Color.black.opacity(0.7).ignoresSafeArea()
            VStack(spacing: 50) {
                DragonBallTitle()
                HStack(spacing: 16) {
                    Button {
                        
                    } label: {
                        Image(systemName: "play.fill")
                            .resizable()
                            .foregroundStyle(.prime)
                            .frame(width: 30,height: 30)
                    }
                    .padding(25)
                    .background(.second)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    Button {
                        
                    } label: {
                        Image("achievement")
                            .resizable()
                            .frame(width: 40,height: 40)
                    }
                    .padding(20)
                    .background(.second)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
            }
        }
    }
}

#Preview {
    MainMenu()
}
