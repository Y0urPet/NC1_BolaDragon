//
//  ContentView.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var treasureCounter = TreasureCounter()
    
    var body: some View {
        VStack {
            if treasureCounter.isWin {
                AnimationDragon()
            } else {
                MainMenu()
            }
        }
    }
}


#Preview {
    ContentView()
}
