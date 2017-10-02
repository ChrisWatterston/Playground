//
//  LLSViewExt.swift
//  LLSPageMenu
//
//  Created by YuriJou on 6/23/15.
//  Copyright (c) 2015 YuriJou. All rights reserved.
//

import UIKit

extension UIView
{
  
  func setOriginX(_ originX: CGFloat)
  {
    
    var frame = self.frame
    frame.origin.x = originX
    self.frame = frame
  }
  
  func setOriginY(_ originY: CGFloat)
  {
    
    var frame = self.frame
    frame.origin.y = originY
    self.frame = frame
  }
  
  func setCenterY(_ centerY: CGFloat)
  {
    var center = self.center
    center.y = centerY
    self.center = center
  }
  
  func setCenterX(_ centerX: CGFloat)
  {
    var center = self.center
    center.x = centerX
    self.center = center
  }
  
  func setFrameHeight(_ height: CGFloat)
  {
    var frame = self.frame
    frame.size.height = height
    self.frame = frame
  }
  
  func setFrameWidth(_ width: CGFloat)
  {
    var frame = self.frame
    frame.size.width = width
    self.frame = frame
  }
  
  func setFrameSize(_ size: CGSize)
  {
    var frame = self.frame
    frame.size = size
    self.frame = frame
  }
  
}
