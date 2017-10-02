//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport

protocol MyDelegate: class {
    func didTapButton()
}

class MyViewController: UIViewController {
    
    lazy var myView: MyView = {
        let view = MyView(frame: CGRect(x: 0, y: 0, width: 300, height: 100))
        view.delegate = self
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
    }
    
}

extension MyViewController: MyDelegate {
    func didTapButton() {
        print("Pressed")
    }
}

class MyView: UIView {
    weak var delegate: MyDelegate?
    
    var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 30))
        button.setTitle("Hi", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .white
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(button)
    }
    
    func buttonTapped() {
        delegate?.didTapButton()
    }
}

PlaygroundPage.current.liveView = MyViewController()