//
//  LLSPageMenuView.swift
//  LLSPageMenu
//
//  Created by YuriJou on 6/19/15.
//  Copyright (c) 2015 YuriJou. All rights reserved.
//

import UIKit

public enum PageMenuViewState: Int
{
  case selected
  case normal
}

public enum PageMenuViewOptions
{
  case selectedFont   (UIFont)
  case normalFont     (UIFont)
  
  case selectedColor  (UIColor)
  case normalColor    (UIColor)
}

open class PageMenuView: UIView,
  UIGestureRecognizerDelegate

{
  open var index: Int     = 0
  open var handleTapClosure: ((_ menuView: PageMenuView) -> Void)?
  
  fileprivate var title: UILabel = UILabel(frame: CGRect.zero)
  fileprivate var selectedFont:  UIFont  = UIFont.systemFont(ofSize: 12.0)
  fileprivate var selectedColor: UIColor = UIColor.black
  fileprivate var normalFont:    UIFont  = UIFont.systemFont(ofSize: 10.0)
  fileprivate var normalColor:   UIColor = UIColor.black
  

  open var state: PageMenuViewState = .normal
  {
    
    didSet{
      switch(state)
      {
      case .selected:
        title.font = self.selectedFont
        title.textColor = self.selectedColor
        
      case .normal:
        self.title.font = self.normalFont
        self.title.textColor = self.normalColor
      }
    }
    
  }
  
  public init(frame: CGRect, options:[PageMenuViewOptions]?)
  {
    super.init(frame: frame)
    setOptions(options)
  }
  
  open func setOptions(_ options: [PageMenuViewOptions]?)
  {
    if let ops = options
    {
      for option in ops
      {
        switch(option)
        {
          case .normalFont(let normalFont):
            self.normalFont = normalFont
          case .normalColor(let normalColor):
            self.normalColor = normalColor
          case .selectedFont(let selectedFont):
            self.selectedFont = selectedFont
          case .selectedColor(let  selectedColor):
            self.selectedColor = selectedColor
        }
      }
    }
    if state == .normal {state = .normal}
    else {state = .selected}
  }
  
  required public init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)!
  }
  override init(frame: CGRect) {
   super.init(frame: frame)
  }

  
  override open func layoutSubviews()
  {
    super.layoutSubviews()
    layoutViews()
  }
  
  open func setText(_ string: String){
    title.text = string
    bringSubview(toFront: self.title)
  }
  
  open func handleTap(_ gusture :UIGestureRecognizer)
  {
    if let closure = self.handleTapClosure
    {
      closure(self)
    }
  }
}

//MARK: handle menu view's layouts
extension PageMenuView
{
  fileprivate func layoutViews()
  {
    addSubview(title)
    title.translatesAutoresizingMaskIntoConstraints = false
    let vertical = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-(0)-[view]-(0)-|",
      options: .alignAllLastBaseline,
      metrics: nil,
      views: ["view":title]
    )
    
    let horizonal = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-(0)-[view]-(0)-|",
      options: .alignAllLastBaseline ,
      metrics: nil,
      views: ["view":title]
    )
    
    addConstraints(vertical + horizonal)
    
    title.isUserInteractionEnabled = false
    title.textAlignment = .center
    
    let tapGes = UITapGestureRecognizer(target: self, action: #selector(PageMenuView.handleTap(_:)))
    tapGes.delegate = self
    addGestureRecognizer(tapGes)
  }

}
