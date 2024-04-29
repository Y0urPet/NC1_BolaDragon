//
//  MainMenu.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI
import RealityKit


struct MainMenu: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.forestGreen.ignoresSafeArea()
                CubeBackground()
                Color.black.opacity(0.7).ignoresSafeArea()
                VStack(spacing: 50) {
                    DragonBallTitle()
                    HStack(spacing: 16) {
                        NavigationLink(destination: ARViewContainer().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).navigationBarTitle("", displayMode: .inline).navigationBarBackButtonHidden()) {
                            Image(systemName: "play.fill")
                                .resizable()
                                .foregroundColor(.prime)
                                .frame(width: 30, height: 30)
                                .padding(25)
                                .background(.second)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        }
                        

                        NavigationLink(
                            destination: Achievement()){
                            Image("achievement")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .padding(20)
                                .background(.second)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        }
                    }
                }
            }
        }
    }
}


