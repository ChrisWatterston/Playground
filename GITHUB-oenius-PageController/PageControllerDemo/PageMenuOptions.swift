//
//  LLSPageMenuOptions.swift
//  LLSPageMenu
//
//  Created by YuriJou on 6/23/15.
//  Copyright (c) 2015 YuriJou. All rights reserved.
//

import UIKit

public enum PageMenuOption
{
  
  case insets           (UIEdgeInsets)
  
  case itemPadding      (CGFloat)
  case itemWidth        (CGFloat)
  case itemHeight       (CGFloat)
  
  case normalColor      (UIColor)
  case selectedColor    (UIColor)
  case indicatorColor   (UIColor)
  case indicatorHeight  (CGFloat)
  
  case menuColor        (UIColor)
  case contentColor     (UIColor)
  
  case itemNormalFont         (UIFont)
  case itemSelectedFont       (UIFont)
}

open class ConfigOptions
{
  var insets: UIEdgeInsets = UIEdgeInsetsMake(15, 0, 0, 0)
  
  var itemHeight:      CGFloat     = 44.0
  var itemWidth:       CGFloat     = 64.0
  var itemPadding:     CGFloat     = 20.0
  var indicatorHeight: CGFloat     = 3.0
  var indicatorWidth: CGFloat      = 54.0
  
  var normalColor:    UIColor  = UIColor.black
  var selectedColor:  UIColor  = UIColor.black
  var indicatorColor: UIColor  = UIColor.black
  var menuColor:      UIColor  = UIColor.white
  var contentColor:   UIColor  = UIColor.white
  
  var itemSelectedFont: UIFont   = UIFont.systemFont(ofSize: 14.0)
  var itemNormalFont:   UIFont   = UIFont.systemFont(ofSize: 14.0)
  
  public init(){}
  
  public init(pageMenuOptions: [PageMenuOption]?)
  {
    if let options = pageMenuOptions
    {
      for option in options
      {
        switch(option)
        {
          
        case .insets(let insets):
          self.insets = insets
          
        case .itemHeight(let height):
          self.itemHeight = height
        
        case .itemWidth(let itemWidth):
          self.itemWidth = itemWidth
        
        case .itemSelectedFont(let itemSelectedFont):
          self.itemSelectedFont = itemSelectedFont
          
        case .itemNormalFont(let itemNormalFont):
          self.itemNormalFont = itemNormalFont
        
        case .itemPadding(let itemPadding):
          self.itemPadding = itemPadding
          
        case .normalColor(let normalColor):
          self.normalColor = normalColor
          
        case .selectedColor(let selectedColor):
          self.selectedColor = selectedColor
          
        case .indicatorColor(let indicatorColor):
          self.indicatorColor = indicatorColor
          
        case .indicatorHeight(let indicatorHeight):
          self.indicatorHeight = indicatorHeight
          
        case .menuColor(let menuColor):
          self.menuColor = menuColor
          
        case .contentColor(let contentColor):
          self.contentColor = contentColor
          
        }
      }
    }
  }
}
