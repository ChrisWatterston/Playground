//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray
        
        view.addSubview(dateWrap)
        
        var date = NSDate()
        print(date)
        
    }


    let dateWrap: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 60, height: 45)
        let shape = CAShapeLayer()
        let bkgrnd = UIBezierPath(arcCenter: CGPoint(x: 30.0, y: 35.0), radius: 30.0, startAngle: 0.0 + 10, endAngle: -.pi, clockwise: false)
        shape.path = bkgrnd.cgPath
        shape.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(shape)
        
        view.clipsToBounds = true
        view.backgroundColor = UIColor.green
        return view
    }()
    

}

PlaygroundPage.current.liveView = MyViewController()