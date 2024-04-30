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
        try AVAudioSession.sharedInstance().setCategory(.playback)
      } catch let error {
        print(error.localizedDescription)
      }
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

class AudioPlayerManager {
    static let shared = AudioPlayerManager()
    
    var audioPlayer: AVAudioPlayer?
    
    func play(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue) //<- No `let`
            audioPlayer?.play()
            print("sound is playing")
        } catch let error {
            print("Sound Play Error -> \(error)")
        }
    }
}

struct MainMenu: View {
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    
    let playerManager = AudioPlayerManager.shared //<-
        
//    @State var message: String = "Test Message2"
//    @State var storedURL: URL?
    
    @State var showHome: Bool = false
    @State private var hexScaling = 1.0
    
    var body: some View {
        NavigationView {
            if showHome {
                ZStack {
                    Color.forestGreen.ignoresSafeArea()
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
                    .onAppear{
                        audioPlayerViewModel.audioPlayer?.numberOfLoops = 5
                        audioPlayerViewModel.audioPlayer?.play()
    //                    guard let path = Bundle.main.path(forResource: "selectSE", ofType: "mp3") else {
    //                        print("Sound file not found")
    //                        return
    //                    }
    //                    let url = URL(fileURLWithPath: path)
    //                    do {
    //                        let fileData = try Data(contentsOf: url)
    //                        storedURL = saveDataFile(data: fileData, fileName: "test.mp3", folderName: "testFolder")
    //                        
    //                        print("File Writing on View -> Success \(storedURL?.absoluteString ?? "nil") ")
    //                    } catch {
    //                        print("Data.init(contentsOf:) failed: \(error)")
    //                    }
    //                    
    //                    playerManager.play(url: storedURL!) //<-
    //                    print("end of code")
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


