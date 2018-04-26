import SceneKit
import UIKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = view as! SCNView
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        scnView.scene = SCNScene()
        
        let rootNode=scnView.scene?.rootNode
        
        let sphereNode = SCNNode(geometry: SCNSphere(radius: 1))
        rootNode?.addChildNode(sphereNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera=SCNCamera()
        cameraNode.position=SCNVector3(0,2,15)
        rootNode?.addChildNode(cameraNode)
        
        let material = SCNMaterial()
        material.diffuse.contents=UIImage(named: "map")
        
        sphereNode.geometry?.firstMaterial=material
        
        let cubeNode = SCNNode(geometry: SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0))
        cubeNode.position=SCNVector3(-3,0,0)
        rootNode?.addChildNode(cubeNode)
        
        cubeNode.geometry?.firstMaterial=SCNMaterial()
        cubeNode.geometry?.firstMaterial?.diffuse.contents=UIImage(named: "brick")
    }
}
