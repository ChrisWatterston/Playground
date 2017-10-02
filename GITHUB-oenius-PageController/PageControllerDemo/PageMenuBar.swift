//
//  LLSPageMenuBar.swift
//  LLSPageMenu
//
//  Created by YuriJou on 6/24/15.
//  Copyright (c) 2015 YuriJou. All rights reserved.
//

import UIKit

open class PageMenuBar: UIScrollView
{
  
  open var configOptions: ConfigOptions = ConfigOptions()
  
  open var selectedMenu: ((_ menu: PageMenuView, _ index: Int) -> Void)?
  
  fileprivate var currentIndex: Int          = 0
  fileprivate var offset: CGFloat            = 0.0
  
  fileprivate var indicator: UIView          = UIView(frame: CGRect.zero)
  
  fileprivate var menuArr: [PageMenuView] = []
  fileprivate var titles:  [String]          = []
  
  fileprivate var beMaked: Bool              = false
  
  public init(frame: CGRect, titles: [String], options: [PageMenuOption])
  {
    super.init(frame: frame)
    
    if titles.count == 0
    {
      return
    }
    
    setTitles(titles, options: options)
  }
  
  open func setTitles(_ titles: [String], options: [PageMenuOption])
  {
    
    configOptions = ConfigOptions(pageMenuOptions: options)
    self.titles = titles
    setupItems()
  
  }
  
  required public init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)!
  }

  
  open override func layoutSubviews() {
    super.layoutSubviews()
    
    if titles.count == 0
    {
      return
    }
    
    if !beMaked
    {
      setupItems()
      
      setupLayout()
      indicator.setCenterX(self.menuArr[currentIndex].center.x)
      menuArr[currentIndex].state = .selected
      
      beMaked = true
    }

  }
  
  fileprivate func setupLayout()
  {
    showsVerticalScrollIndicator = false
    showsHorizontalScrollIndicator = false
    scrollsToTop = false
    isScrollEnabled = true
    
    addSubview(indicator)
    
    indicator.setFrameHeight(configOptions.indicatorHeight)

    indicator.setFrameWidth(50)
    indicator.setOriginY(frame.height - configOptions.indicatorHeight)
    
    indicator.backgroundColor = configOptions.indicatorColor
  }
  
  fileprivate func setupItems()
  {
    for view in menuArr
    {
      view.removeFromSuperview()
    }
    
    
    menuArr.removeAll(keepingCapacity: true)
    
    let frame = CGRect(x: 0,
      y: configOptions.insets.top,
      width: configOptions.itemWidth,
      height: configOptions.itemHeight)
    
    for title in titles
    {
      let view = PageMenuView(frame: frame, options: [
        
          .selectedFont(configOptions.itemSelectedFont),
          .normalFont(configOptions.itemNormalFont),
        
          .selectedColor(configOptions.selectedColor),
          .normalColor(configOptions.normalColor),
        
        ])
      view.backgroundColor = UIColor.clear
      addSubview(view)
      view.index = menuArr.count
    
      view.setText(title.isEmpty ? "MENU_\(view.index)" : title)
      
      view.state = .normal
      
      view.handleTapClosure = {(menuView: PageMenuView) -> Void in
        self.scrollToIndex(menuView.index)
      }
      menuArr.append(view)
    }
    
    pushItemCentralAlign(configOptions.itemWidth)
    
  }
  
}

//MARK: page menu bar's push item
extension PageMenuBar
{
  fileprivate func pushItemCentralAlign(_ width: CGFloat)
  {
    let padding = configOptions.itemPadding
    let left = configOptions.insets.left
    
    let contentWidth = padding * CGFloat(menuArr.count - 1) +
      width * CGFloat(menuArr.count) +
      left * 2
    
    contentSize = CGSize(width: contentWidth, height: 0)
    var startX = left
    if contentWidth < frame.width
    {
      startX = (self.frame.width - contentWidth) / 2 + left
    }
    
    for index in 0 ..< menuArr.count
    {
      menuArr[index].setOriginX(startX + padding * CGFloat(index) + width * CGFloat(index))
    }
    
    
    let count = floor(Float(frame.width) / Float(width + padding));
    let moveCount = titles.count - Int(count)
    
    if moveCount > 0
    {
      let totalOffset = contentWidth - frame.width
      offset = totalOffset / CGFloat(titles.count - 1)
    }
  }

}

//MARK: handle menu bar's layout
extension PageMenuBar
{
  fileprivate func scrollToIndex(_ index: Int){
    menuArr[currentIndex].state = .normal
    UIView.animate(withDuration: 0.2, animations: { () -> Void in
      self.indicator.setCenterX(self.menuArr[index].center.x)
    })
    menuArr[index].state = .selected
    if let closure = selectedMenu
    {
      closure(menuArr[index], index)
    }
    
    setContentOffset(CGPoint(x: offset * CGFloat(index), y: 0), animated: true)
    currentIndex = index
    
  }
  
  fileprivate func moveNext()
  {
    
    currentIndex += 1
    currentIndex > titles.count ? currentIndex = titles.count : scrollToIndex(currentIndex)
  }
  
  fileprivate func movePre()
  {
    currentIndex -= 1
    currentIndex < 0 ? currentIndex = 0 : scrollToIndex(currentIndex)
  }

}
