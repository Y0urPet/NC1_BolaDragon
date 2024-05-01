//
//  ContentView.swift
//  BasicAR
//
//  Created by Timothy Andrian on 22/04/24.
//

import SwiftUI
import RealityKit



struct AR: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var treasureCounter: TreasureCounter
    @State private var floorScanned = false
    
    
    var body: some View {
        
        ZStack {
          
            ARViewContainer(treasureCounter: treasureCounter).ignoresSafeArea().overlay {
                if treasureCounter.isWin {
                    AnimationDragon()
                        .onAppear {
                            // Dismiss the AR view when the treasure hunt is completed
                            print("AnimationDragon appeared. Dismissing AR view.")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                }
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
            
            
        }
    }
}


class TreasureCounter: ObservableObject {
    @Published var treasuresFound: Int = 0
    let totalTreasures: Int = 3
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
            
            if treasureCounter.treasuresFound == 21 {
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


struct ARViewContainer: UIViewRepresentable {
    
    @ObservedObject var treasureCounter = TreasureCounter()
    @State private var floorScanned = false
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        context.coordinator.view = arView
        
        

        
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
            SIMD3<Float>(1, 1, 1),
            SIMD3<Float>(5, 0, 10),
            SIMD3<Float>(3, 1.5, 6),
            SIMD3<Float>(1, 2, 3),
            SIMD3<Float>(3, 2, 10),
            SIMD3<Float>(4, 1.2, 2),
            SIMD3<Float>(10, 2, 2)
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
