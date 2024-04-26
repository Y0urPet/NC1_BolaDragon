//
//  CubeBackground.swift
//  NC1_BolaDragon
//
//  Created by Timothy Andrian on 25/04/24.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
}

struct CubeBackground: View {
    @StateObject private var motion = MotionManager()
    
    @State var hexScaling: CGFloat = 1
    
    @State var hexScaling1: CGFloat = 1
    
    @State var hexDegree: Double = 0
    
    let totalDuration = 3.0
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(1..<5) { i in
                HStack(spacing: 30) {
                    ForEach(1..<5) { i in
                        DragonBallOne()
                        DragonBallTwo()
                    }
                }
                HStack(spacing: 30) {
                    ForEach(1..<5) { i in
                        DragonBallTwo()
                        DragonBallOne()
                    }
                }
                HStack(spacing: 30) {
                    ForEach(1..<5) { i in
                        DragonBallOne()
                        DragonBallTwo()
                    }
                }
                HStack(spacing: 30) {
                    ForEach(1..<5) { i in
                        DragonBallTwo()
                        DragonBallOne()
                    }
                }
                HStack(spacing: 30) {
                    ForEach(1..<5) { i in
                        DragonBallOne()
                        DragonBallTwo()
                    }
                }
                HStack(spacing: 30) {
                    ForEach(1..<5) { i in
                        DragonBallTwo()
                        DragonBallOne()
                    }
                }
            }
        }
        .keyframeAnimator(initialValue: AnimationProperties(), repeating: true) { content, value in
            content
                .offset(y: value.yTranslation)
                
        } keyframes: { _ in
            KeyframeTrack(\.yTranslation) {
                CubicKeyframe(0, duration: totalDuration * 0.1)
                CubicKeyframe(-350, duration: totalDuration * 2)
                CubicKeyframe(0, duration: totalDuration * 2)
            }
        }
        .position(CGPoint(x: UIScreen.main.bounds.width/2 + motion.x * 280, y: UIScreen.main.bounds.height-300 + motion.y * 280))
    }
}

struct AnimationProperties {
    var yTranslation = 0.0
    var verticalStretch = 1.0
}

#Preview {
    CubeBackground()
}
