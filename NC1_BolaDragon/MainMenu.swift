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
      if let sound = Bundle.main.path(forResource: "dragon", ofType: "mp3") {
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
      do {
        try AVAudioSession.sharedInstance().setCategory(.playback)
      } catch let error {
        print(error.localizedDescription)
      }
      player.play()
  }
}

struct MainMenu: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    
    @State var showHome: Bool = false
    @State private var hexScaling = 1.0
    
    var body: some View {
        NavigationView {
            if showHome {
                ZStack {
                    Color.dragonColorNeck.ignoresSafeArea()
                    CubeBackground()
                    Color.black.opacity(0.7).ignoresSafeArea()
                    VStack(spacing: 50) {
                        DragonBallTitle()
                            .scaleEffect(hexScaling)
                            .onAppear{
                                // for scaling
                                let baseAnimate1 = Animation.linear(duration: 1)
                                let rep1 = baseAnimate1.repeatForever(autoreverses: true)
                                withAnimation(rep1) {
                                    hexScaling = 0.9
                                }
                            }
                        HStack(spacing: 16) {
                            NavigationLink(destination: AR(treasureCounter: TreasureCounter()).edgesIgnoringSafeArea(.all).navigationBarTitle("", displayMode: .inline).navigationBarBackButtonHidden()) {
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width: 30, height: 30)
                                    .padding(25)
                                    .background(.orange.gradient)
                                    .saturation(6.0)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            }.animation(.none)
                        }
                    }
                    .onAppear{
                        audioPlayerViewModel.audioPlayer?.numberOfLoops = 5
                        audioPlayerViewModel.playOrPause()
                    }
                }
            } else {
                SevenAnimation(showHome: $showHome)
            }
        }
    }
}

#Preview {
    MainMenu()
}


