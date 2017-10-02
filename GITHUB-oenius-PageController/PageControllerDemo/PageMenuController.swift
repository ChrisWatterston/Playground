//
//  LLSPageMenuController.swift
//  LLSPageMenu
//
//  Created by Yuri.Jou on 6/19/15.
//  Copyright (c) 2015 YuriJou. All rights reserved.
//

import UIKit

open class PageMenuController:
  UIViewController,
  UIScrollViewDelegate,
  UIGestureRecognizerDelegate
{

  open var menuArr:[PageMenuView] = []
  open var controllerArr: [UIViewController] = []{
    didSet{
      reloadData()
    }
  }
  
  open var configOptions: ConfigOptions = ConfigOptions(){
    didSet{
      
      reloadData()
    }
  }
  
  public init(viewControllers: [UIViewController], frame: CGRect, options: [PageMenuOption]?)
  {
    super.init(nibName: nil, bundle: nil)
    
    if viewControllers.count == 0
    {
      return
    }
    
    controllerArr = viewControllers
    view.frame = frame
    
    reloadData()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  fileprivate var offset: CGFloat  = 0
  fileprivate var currentPage: Int = 0
  
  fileprivate let menu      = UIScrollView()
  fileprivate let content   = UIScrollView()
  
  fileprivate var indicator: UIView = UIView(frame: CGRect.zero)
  
  
  fileprivate func reloadData()
  {
    setup()
    pushMenuItems()

    scrollToPage(currentPage)
    menuArr[currentPage].state = .selected
  }
  
  fileprivate func setup()
  {
    decorateScrollView(menu)
    decorateScrollView(content)
    
    layoutViews()
    content.contentSize = CGSize(width: CGFloat(controllerArr.count) * content.frame.width, height: 0)
  }
  
  //MARK: - layout
  fileprivate func layoutViews()
  {
    view.addSubview(menu)
    menu.backgroundColor = configOptions.menuColor
    menu.translatesAutoresizingMaskIntoConstraints = false
    
    let mv = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-(0)-[view(==60)]",
      options: .alignAllLastBaseline,
      metrics: nil,
      views: ["view" : menu])
    
    let mh = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-(0)-[view]-(0)-|",
      options: .alignAllLastBaseline,
      metrics: nil,
      views: ["view" : menu])
    
    view.addConstraints(mv + mh)
    
    content.backgroundColor = configOptions.contentColor
    view.addSubview(content)
    content.translatesAutoresizingMaskIntoConstraints = false
    
    let cv = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-(60)-[view]-(0)-|",
      options: .alignAllLastBaseline,
      metrics: nil,
      views: ["view" : content])
    
    let ch = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-(0)-[view]-(0)-|",
      options: .alignAllLastBaseline,
      metrics: nil,
      views: ["view" : content])
    
    view.addConstraints(cv + ch)
    
    menu.addSubview(indicator)
    
    indicator.backgroundColor = configOptions.indicatorColor
    indicator.isUserInteractionEnabled = false
    
    indicator.setFrameHeight(configOptions.indicatorHeight)
    indicator.setFrameWidth(configOptions.indicatorWidth)
    let originY = configOptions.itemHeight - configOptions.indicatorHeight + configOptions.insets.top
    indicator.setOriginY(originY)
    
  }
  
  fileprivate func decorateScrollView(_ scrollview :UIScrollView)
  {
    scrollview.showsHorizontalScrollIndicator = false
    scrollview.showsVerticalScrollIndicator   = false
    scrollview.scrollsToTop = false
    scrollview.isScrollEnabled = false
  }
  
}

//MARK: handle page's selected state
extension PageMenuController
{
  func setMenuOptions()
  {
    for m in menuArr
    {
      m.setOptions([
          .selectedColor(configOptions.selectedColor),
          .normalColor(configOptions.normalColor),
          .selectedFont(configOptions.itemSelectedFont),
          .normalFont(configOptions.itemNormalFont),
        ])
    }

  }
}

//MARK: handle page's layout action
extension PageMenuController
{
  
  func pushMenuItems()
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
    
    for controller in controllerArr
    {
      let view = PageMenuView(frame: frame)
      view.backgroundColor = UIColor.clear
      menu.addSubview(view)
      
      view.index = menuArr.count
      view.state = .normal
      view.setText(controller.title ?? "MENU_\(view.index)")

      view.handleTapClosure = {(menuView: PageMenuView) -> Void in
        
        self.menuArr[self.currentPage].state = .normal
        
        UIView.animate(withDuration: 0.2, animations: {
          self.indicator.setCenterX(menuView.center.x)
        })
        
        self.scrollToPage(menuView.index)
        menuView.state = .selected
      }
      menuArr.append(view)
    }
    pushItemCentralAlign(configOptions.itemWidth)
    indicator.setCenterX(menuArr[0].center.x)
    setMenuOptions()
  }
  
  func pushItemCentralAlign(_ width: CGFloat)
  {
    let trail = configOptions.insets.left
    let spacing = configOptions.itemPadding
    
    let spaces = spacing * CGFloat(menuArr.count - 1)
    let widths = width * CGFloat(menuArr.count)
    let trails = trail * 2
    
    let totalWidth = spaces + widths + trails
    
    menu.contentSize = CGSize(width: totalWidth, height: 0)
    
    var startX = trail
    
    if totalWidth < view.frame.width
    {
      startX = (view.frame.width - totalWidth) / 2 + trail
    }
    
    for index in 0 ..< menuArr.count
    {
      menuArr[index].setOriginX(startX + trail * CGFloat(index) + width * CGFloat(index) + spacing * CGFloat(index))
    }
    
    let count = Int(floor(CGFloat(view.frame.width) / CGFloat(width + spacing)));
    let moveCount = controllerArr.count - count
    
    if moveCount > 0
    {
      let totalOffset = totalWidth - view.frame.width
      offset = totalOffset / CGFloat(controllerArr.count - 1)
    }
  }
  
}


//MARK: handle page's moved action
extension PageMenuController
{
  fileprivate func scrollToPage(_ page: Int){
    currentPage = page
    
    let offsetX = CGFloat(page) * view.frame.width;
    content.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    menu.setContentOffset(CGPoint(x: offset * CGFloat(page), y: 0), animated: true)
    
    let controller = controllerArr[page]
    controller.willMove(toParentViewController: self)
    
    let pageWidth = content.frame.width
    let pageHeight = content.frame.height
    
    controller.view.frame = CGRect(
      x: CGFloat(page) * pageWidth,
      y: 0,
      width: pageWidth,
      height: pageHeight
    )
    
    addChildViewController(controller)
    content.addSubview(controller.view)
    controller.didMove(toParentViewController: self)
  }

  fileprivate func moveNext()
  {
    currentPage += 1
    currentPage > 0 ? currentPage = controllerArr.count : scrollToPage(currentPage)
  }
  
  fileprivate func movePre()
  {
    currentPage -= 1
    currentPage < 0 ? currentPage = 0 : scrollToPage(currentPage)
  }

}
