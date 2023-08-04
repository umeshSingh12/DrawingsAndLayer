import UIKit

class SmileyEmojiView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Create a circle for the face
        let faceLayer = CAShapeLayer()
        let faceRadius = min(rect.width, rect.height) / 2
        let faceCenter = CGPoint(x: rect.midX, y: rect.midY)
        let facePath = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        faceLayer.path = facePath.cgPath
        faceLayer.fillColor = UIColor.yellow.cgColor
        layer.addSublayer(faceLayer)
        
        // Create circles for the eyes
        let eyeRadius = faceRadius / 6
        let leftEyeCenter = CGPoint(x: faceCenter.x - faceRadius / 3, y: faceCenter.y - faceRadius / 3)
        let rightEyeCenter = CGPoint(x: faceCenter.x + faceRadius / 3, y: faceCenter.y - faceRadius / 3)
        
        let leftEyeLayer = CAShapeLayer()
        let leftEyePath = UIBezierPath(arcCenter: leftEyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        leftEyeLayer.path = leftEyePath.cgPath
        leftEyeLayer.fillColor = UIColor.black.cgColor
        layer.addSublayer(leftEyeLayer)
        
        let rightEyeLayer = CAShapeLayer()
        let rightEyePath = UIBezierPath(arcCenter: rightEyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        rightEyeLayer.path = rightEyePath.cgPath
        rightEyeLayer.fillColor = UIColor.black.cgColor
        layer.addSublayer(rightEyeLayer)
        
        // Create a parabolic curve for the mouth (like a smile)
        let mouthLayer = CAShapeLayer()
        let mouthPath = UIBezierPath()
        let smileStart = CGPoint(x: faceCenter.x - faceRadius / 2, y: faceCenter.y + faceRadius / 3)
        let smileEnd = CGPoint(x: faceCenter.x + faceRadius / 2, y: faceCenter.y + faceRadius / 3)
        let controlPoint = CGPoint(x: faceCenter.x, y: faceCenter.y + faceRadius / 1.5)
        mouthPath.move(to: smileStart)
        mouthPath.addQuadCurve(to: smileEnd, controlPoint: controlPoint)
        mouthLayer.path = mouthPath.cgPath
        mouthLayer.fillColor = UIColor.clear.cgColor
        mouthLayer.strokeColor = UIColor.red.cgColor
        mouthLayer.lineWidth = 5.0
        layer.addSublayer(mouthLayer)
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let smileyEmojiView = SmileyEmojiView(frame: CGRect(x: 100, y: 200, width: 200, height: 200))
        view.addSubview(smileyEmojiView)
    }
}
