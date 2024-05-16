//
//  ContentView.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var treasureCounter: TreasureCounter = TreasureCounter()
    var body: some View {
        VStack {
            MainMenu(treasureCounter: treasureCounter)
        }
    }
}


#Preview {
    ContentView()
}
