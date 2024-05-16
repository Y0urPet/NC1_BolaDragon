//
//  ContentView.swift
//  BasicAR
//
//  Created by Timothy Andrian on 22/04/24.
//

import SwiftUI
import RealityKit
import ARKit


struct AR: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var treasureCounter: TreasureCounter
    @ObservedObject var isCoaching: IsChoachingHappen
    @State private var floorScanned = false
//    @Binding var isCoaching: Bool
    
    var body: some View {
        
        ZStack {
          
            ARViewContainer(treasureCounter: treasureCounter).ignoresSafeArea().overlay {
                
                if treasureCounter.isWin {
                    AnimationDragon()
                        .onAppear {
                            // Dismiss the AR view when the treasure hunt is completed
                            print("AnimationDragon appeared. Dismissing AR view.")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                }
                ZStack {
                    if !treasureCounter.isWin {
                        VStack {
                            HStack{
                                if treasureCounter.treasuresFound >= 1*3 {
                                    BallOne().colorMultiply(.green) // Ungrayscale BallOne
                                }
                                
                                if treasureCounter.treasuresFound >= 2*3 {
                                    BallTwo().colorMultiply(.green)  // Ungrayscale BallOne
                                }
                               
                                if treasureCounter.treasuresFound >= 3*3 {
                                    BallThree().colorMultiply(.green) // Ungrayscale BallOne
                                }
                                if treasureCounter.treasuresFound >= 4*3 {
                                    BallFourth().colorMultiply(.green)  // Ungrayscale BallOne
                                }
                            }
                            HStack{
                                if treasureCounter.treasuresFound >= 5*3 {
                                    BallFifth().colorMultiply(.green)  // Ungrayscale BallOne
                                }
                                if treasureCounter.treasuresFound >= 6*3 {
                                    BallSixth().colorMultiply(.green)  // Ungrayscale BallOne
                                }
                                if treasureCounter.treasuresFound >= 7*3 {
                                    BallSeventh().colorMultiply(.green)  // Ungrayscale BallOne
                                }
                            }
                            
                        }
                        .offset(y:-300)
                    }
//                    if isCoaching.isCoaching {
//                        Rectangle()
//                            .frame(width: 230,height: 40)
//                            .offset(y:90)
//                            .foregroundStyle(.white)
//                        .blur(radius: 3.0)
//                    } else {
//                        EmptyView()
//                    }
                }
            }
        }
    }
}


class TreasureCounter: ObservableObject {
    @Published var treasuresFound: Int = 0
    @Published var totalTreasures: Int = 3
    @Published var isWin: Bool = false
}
 

class Coordinator: NSObject {
    weak var view: ARView?
    let treasureCounter: TreasureCounter

    init(treasureCounter: TreasureCounter) {
        self.treasureCounter = treasureCounter
    }

    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        guard let view = self.view else { return }

        let tapLocation = recognizer.location(in: view)

        if let tappedEntity = view.entity(at: tapLocation) as? ModelEntity {
            
           tappedEntity.isEnabled = false
            // Update the count of treasures found
            treasureCounter.treasuresFound += 1

            // Display the count on the screen
            
            if treasureCounter.treasuresFound == 3 {
                print("You Win!")
                treasureCounter.isWin = true
                if treasureCounter.isWin {
                    print("You have win!")
                }
            } else {
                print("Treasures Found: \(treasureCounter.treasuresFound)")
            }
        }
    }
}

extension ARView: ARCoachingOverlayViewDelegate {
    func addCoaching(coaching: ARCoachingOverlayView) {
        // Make sure it rescales if the device orientation changes
        coaching.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(coaching)
        // Set the Augmented Reality goal
        coaching.goal = .horizontalPlane
        // Set the ARSession
        coaching.session = self.session
        // Set the delegate for any callbacks
        coaching.delegate = self
    }
    
    // trigger when coaching happen
    public func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
//        isCoaching.isCoaching = true
        print("Coaching Begin!!")
    }
    
    // trigger when coaching ended
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
//        isCoaching.isCoaching = false
        print("Coaching Ended!!")
    }
}

public class IsChoachingHappen: ObservableObject {
    // ini tinggal diganti jadi untuk memunculkan sensor tulisan
    @Published var isCoaching: Bool = true
}

struct ARViewContainer: UIViewRepresentable {
    
    @ObservedObject var treasureCounter = TreasureCounter()
    @State private var floorScanned = false
    let coachingOverlay = ARCoachingOverlayView()
//    @ObservedObject var isCoaching: IsChoachingHappen
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        context.coordinator.view = arView
        
        arView.addCoaching(coaching: coachingOverlay)
        arView.coachingOverlayViewWillActivate(coachingOverlay)
        arView.coachingOverlayViewDidDeactivate(coachingOverlay)

        
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        
        
        // Load the treasure models
        let treasureModel1 = try! Entity.load(named: "Dragon_Ball")
        let treasureModel2 = try! Entity.load(named: "Dragon_Ball")
        let treasureModel3 = try! Entity.load(named: "Dragon_Ball")
        let treasureModel4 = try! Entity.load(named: "Dragon_Ball")
        let treasureModel5 = try! Entity.load(named: "Dragon_Ball")
        let treasureModel6 = try! Entity.load(named: "Dragon_Ball")
        let treasureModel7 = try! Entity.load(named: "Dragon_Ball")
        
        
        treasureModel1.generateCollisionShapes(recursive: true)
        treasureModel2.generateCollisionShapes(recursive: true)
        treasureModel3.generateCollisionShapes(recursive: true)
        treasureModel4.generateCollisionShapes(recursive: true)
        treasureModel5.generateCollisionShapes(recursive: true)
        treasureModel6.generateCollisionShapes(recursive: true)
        treasureModel7.generateCollisionShapes(recursive: true)

        
        // Scale the treasure models
        let scale: Float = 0.01
        treasureModel1.scale = SIMD3<Float>(repeating: scale)
        treasureModel2.scale = SIMD3<Float>(repeating: scale)
        treasureModel3.scale = SIMD3<Float>(repeating: scale)
        treasureModel4.scale = SIMD3<Float>(repeating: scale)
        treasureModel5.scale = SIMD3<Float>(repeating: scale)
        treasureModel6.scale = SIMD3<Float>(repeating: scale)
        treasureModel7.scale = SIMD3<Float>(repeating: scale)
        
        // Position the treasures in the scene
        let anchor = AnchorEntity(plane: .horizontal)
        let treasurePositions: [SIMD3<Float>] = [
            SIMD3<Float>(0, 0, 0),
            SIMD3<Float>(-5, 0, 10),
            SIMD3<Float>(-2, 1.5, -6),
            SIMD3<Float>(1, 2, 7),
            SIMD3<Float>(7, 2, -5),
            SIMD3<Float>(-4, 1.2, -2),
            SIMD3<Float>(-3, 2, 2)
        ]
        
                
        for (index, position) in treasurePositions.enumerated() {
            let treasureModel = [treasureModel1, treasureModel2, treasureModel3, treasureModel4, treasureModel5, treasureModel6, treasureModel7][index]
            treasureModel.name = "Treasure"
            treasureModel.transform.translation = position
            anchor.addChild(treasureModel)
        }

        
        
        
        arView.scene.addAnchor(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        
        
        
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(treasureCounter: treasureCounter)
    }
    
}

#Preview {
    ContentView()
}
