//
//  MainMenu.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI
import AVFoundation

class AudioPlayerViewModel: ObservableObject {
    var audioPlayer: AVAudioPlayer?

  init() {
    if let sound = Bundle.main.path(forResource: "dragonTheme", ofType: "mp3") {
      do {
        self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
      } catch {
        print("AVAudioPlayer could not be instantiated.")
      }
    } else {
      print("Audio file could not be found.")
    }
  }

  func playOrPause() {
    guard let player = audioPlayer else { return }

      player.play()
  }
}

struct MainMenu: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.forestGreen.ignoresSafeArea()
                CubeBackground()
                Color.black.opacity(0.7).ignoresSafeArea()
                VStack(spacing: 50) {
                    DragonBallTitle().animation(.none)
                    HStack(spacing: 16) {
                        NavigationLink(destination: AR(treasureCounter: TreasureCounter()).edgesIgnoringSafeArea(.all).navigationBarTitle("", displayMode: .inline).navigationBarBackButtonHidden()) {
                            Image(systemName: "play.fill")
                                .resizable()
                                .foregroundColor(.prime)
                                .frame(width: 30, height: 30)
                                .padding(25)
                                .background(.second)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        }.animation(.none)
                        

//                        NavigationLink(
//                            destination: Achievement()){
//                            Image("achievement")
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                                .padding(20)
//                                .background(.second)
//                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
//                        }.animation(.none)
                    }
                }
            }.onAppear{
                audioPlayerViewModel.audioPlayer?.numberOfLoops = 5
                audioPlayerViewModel.audioPlayer?.play()
            }
        }
    }
}

#Preview {
    MainMenu()
}


