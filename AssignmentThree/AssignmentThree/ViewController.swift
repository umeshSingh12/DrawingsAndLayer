import UIKit

class TerrainView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Draw sky
        let skyRect = CGRect(x: 0, y: 0, width: rect.width, height: rect.height * 0.5)
        context.setFillColor(UIColor(red: 0.5, green: 0.8, blue: 1.0, alpha: 1.0).cgColor)
        context.fill(skyRect)
        
        // Draw sun in the left corner of the sky
        let sunRadius: CGFloat = 30
        let sunCenter = CGPoint(x: sunRadius + 70, y: sunRadius + 170)
        let sunPath = UIBezierPath(arcCenter: sunCenter, radius: sunRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        context.setFillColor(UIColor.yellow.cgColor)
        context.addPath(sunPath.cgPath)
        context.fillPath()
        
        // Draw ground
        let groundRect = CGRect(x: 0, y: rect.height * 0.5, width: rect.width, height: rect.height * 0.5)
        context.setFillColor(UIColor(red: 0.0, green: 0.7, blue: 0.0, alpha: 1.0).cgColor)
        context.fill(groundRect)
        
        // Draw tree trunk
        let trunkWidth: CGFloat = 40
        let trunkHeight: CGFloat = 120
        let trunkRect = CGRect(x: rect.midX - trunkWidth / 2 + 100, y: rect.height * 0.5 - trunkHeight, width: trunkWidth, height: trunkHeight)
        context.setFillColor(UIColor.brown.cgColor)
        context.fill(trunkRect)
        
        // Draw tree leaves
        let leavesRadius: CGFloat = 40
        let leavesCenter = CGPoint(x: rect.midX + 100, y: rect.height * 0.5 - trunkHeight)
        
        context.setFillColor(UIColor.green.cgColor)
        let middleLeafY = leavesCenter.y - leavesRadius * cos(CGFloat.pi / 3)
        
        // Position the other two circles connected to the trunk
        let leftLeafX = leavesCenter.x - leavesRadius * sin(CGFloat.pi / 3)
        let leftLeafY = leavesCenter.y + leavesRadius * cos(CGFloat.pi / 3)
        let rightLeafX = leavesCenter.x + leavesRadius * sin(CGFloat.pi / 3)
        let rightLeafY = leftLeafY
        
        // Draw the leaves
        let leafPositions: [(CGFloat, CGFloat)] = [
            (leavesCenter.x, middleLeafY), // Middle circle
            (leftLeafX, leftLeafY),        // Left circle
            (rightLeafX, rightLeafY)       // Right circle
        ]
        
        for (x, y) in leafPositions {
            let leafPath = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: leavesRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
            context.addPath(leafPath.cgPath)
            context.fillPath()
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let terrainView = TerrainView(frame: view.bounds)
        terrainView.backgroundColor = .white
        view.addSubview(terrainView)
    }
}
