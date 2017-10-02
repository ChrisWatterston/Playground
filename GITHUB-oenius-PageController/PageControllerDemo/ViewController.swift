//
//  ViewController.swift
//  PageControllerDemo
//
//  Created by YURI_JOU on 15/9/28.
//  Copyright © 2015年 oenius. All rights reserved.
//

import UIKit

class ViewController: PageMenuController {

  override func viewDidLoad() {
    super.viewDidLoad()
    UIApplication.shared.isStatusBarHidden = true
    
    view.backgroundColor = UIColor.yellow
    
    let titles: [String] = [
      "HAPPY",
      "FOOD",
      "OENIUS",
      "FUNNY",
      "STORY",
      "COOL",
      "MOOD",
    ]
    
    let controllers = titles.map { (title) -> UIViewController in
      let v = UIViewController()
      v.view.backgroundColor = UIColor(red: 70.0 / 255, green: 70.0 / 255, blue: 70.0 / 255, alpha: 1)
      let container = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
      container.backgroundColor = UIColor.clear
      container.layer.borderColor = UIColor.orange.cgColor
      container.layer.borderWidth = 2.0
      container.layer.cornerRadius = 100
      container.layer.masksToBounds = true
      container.center = v.view.center
      let label = UILabel(frame: CGRect(x: 0, y: 0, width: v.view.frame.width, height: 60))
      label.text = title
      label.font = UIFont.systemFont(ofSize: 20)
      label.textAlignment = .center
      label.textColor = UIColor.orange
      label.center = container.center
      v.view .addSubview(label)
      v.view .addSubview(container)
      v.title = title
      return v
    }
    
    self.controllerArr = controllers;
    
    self.configOptions = ConfigOptions(
      pageMenuOptions:
      [
        .selectedColor(UIColor.orange),
        .normalColor(UIColor.white),
        .indicatorColor(UIColor.orange),
        .menuColor(UIColor(red: 30.0 / 255, green: 30.0 / 255, blue: 30.0 / 255, alpha: 1)),
      ]
    )
  }



    


}

