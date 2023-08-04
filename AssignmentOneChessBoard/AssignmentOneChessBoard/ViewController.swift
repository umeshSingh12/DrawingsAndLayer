import UIKit

class ChessboardView: UIView {
    
    override func draw(_ rect: CGRect) {
        let squareSize = rect.width / 8.0
        
        // Draw the chessboard squares
        for row in 0..<8 {
            for col in 0..<8 {
                let x = CGFloat(col) * squareSize
                let y = CGFloat(row) * squareSize
                let squareRect = CGRect(x: x, y: y, width: squareSize, height: squareSize)
                let color: UIColor = (row + col) % 2 == 0 ? .white : .black
                color.setFill()
                UIRectFill(squareRect)
            }
        }
        
        // Draw the outline of the chessboard
        let outlinePath = UIBezierPath(rect: rect)
        UIColor.black.setStroke()
        outlinePath.lineWidth = 2.0
        outlinePath.stroke()
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chessboardView = ChessboardView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        chessboardView.backgroundColor = .clear
        view.addSubview(chessboardView)
    }
}
