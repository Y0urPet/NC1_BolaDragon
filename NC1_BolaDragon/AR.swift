//
//  ContentView.swift
//  BasicAR
//
//  Created by Timothy Andrian on 22/04/24.
//

import SwiftUI
import RealityKit

struct AR: View {
    var body: some View {
        
        
        ARViewContainer().edgesIgnoringSafeArea(.all).navigationBarTitle("", displayMode: .inline)
    }
}
class Coordinator: NSObject {
    weak var view: ARView?
    var treasuresFound: Int = 0
    var totalTreasures: Int = 3 // Adjust the total number of treasures
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        
        guard let view = self.view else { return }
        
        let tapLocation = recognizer.location(in: view)
        
        if let _ = view.entity(at: tapLocation) as? ModelEntity {
            // Update the count of treasures found
            treasuresFound += 1
            
            // Display the count on the screen
            print("Treasures Found: \(treasuresFound)")
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        context.coordinator.view = arView
        
        arView.environment.sceneUnderstanding.options.insert(.occlusion)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        // Load the treasure models
        let treasureModel1 = try! Entity.load(named: "Iniapa")
        let treasureModel2 = try! Entity.load(named: "Iniapa")
        let treasureModel3 = try! Entity.load(named: "Iniapa")
        
        // Scale the treasure models
        let scale: Float = 0.001
        treasureModel1.scale = SIMD3<Float>(repeating: scale)
        treasureModel2.scale = SIMD3<Float>(repeating: scale)
        treasureModel3.scale = SIMD3<Float>(repeating: scale)
        
        // Position the treasures in the scene
        let anchor = AnchorEntity(plane: .horizontal)
        let treasurePositions: [SIMD3<Float>] = [
            SIMD3<Float>(1.3, 50.23, -382.25),
            SIMD3<Float>(56.36, 1.26, -910.21),
            SIMD3<Float>(4.39, 5, -612.59)
        ]
        
        for (index, position) in treasurePositions.enumerated() {
            let treasure = index == 0 ? treasureModel1 : (index == 1 ? treasureModel2 : treasureModel3)
            treasure.name = "Treasure"
            treasure.transform.translation = position
            anchor.addChild(treasure)
        }
        
        arView.scene.addAnchor(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
}

#Preview {
    ContentView()
}
