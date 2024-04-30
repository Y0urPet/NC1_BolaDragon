//
//  ContentView.swift
//  BasicAR
//
//  Created by Timothy Andrian on 22/04/24.
//

import SwiftUI
import RealityKit

struct AR: View {
    let treasureCounter: TreasureCounter
    var body: some View {
        ZStack {
            ARViewContainer().ignoresSafeArea().overlay {
                if treasureCounter.isWin {
                    AnimationDragon()
                }
//                AnimationDragon()
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

        if let _ = view.entity(at: tapLocation) as? ModelEntity {
            // Update the count of treasures found
            treasureCounter.treasuresFound += 1

            // Display the count on the screen
            
            if treasureCounter.treasuresFound == 7 {
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
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        context.coordinator.view = arView
        

        
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        
        
        // Load the treasure models
        let treasureModel1 = try! Entity.load(named: "Iniapa")
        let treasureModel2 = try! Entity.load(named: "Iniapa")
        let treasureModel3 = try! Entity.load(named: "Iniapa")
        
        treasureModel1.generateCollisionShapes(recursive: true)
        
        
        treasureModel2.generateCollisionShapes(recursive: true)
        
        
        treasureModel3.generateCollisionShapes(recursive: true)

        
        // Scale the treasure models
        let scale: Float = 0.001
        treasureModel1.scale = SIMD3<Float>(repeating: scale)
        treasureModel2.scale = SIMD3<Float>(repeating: scale)
        treasureModel3.scale = SIMD3<Float>(repeating: scale)
        
        // Position the treasures in the scene
//        let anchor = AnchorEntity(plane: .horizontal)
//        let treasurePositions: [SIMD3<Float>] = [
//            SIMD3<Float>(1, 1, 1),
//            SIMD3<Float>(2, 2, 2),
//            SIMD3<Float>(1, 2, 1)
//        ]
//        
//                
//        for (index, position) in treasurePositions.enumerated() {
//            let treasure = index == 0 ? treasureModel1 : (index == 1 ? treasureModel2 : treasureModel3)
//            treasure.name = "Treasure"
//            treasure.transform.translation = position
//            anchor.addChild(treasure)
//        }
//        
//        
//        
//        arView.scene.addAnchor(anchor)
        
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
