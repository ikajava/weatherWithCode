//
//  PageViewController.swift
//  16_lesson_pageViewContoller
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    let viewController1: UIViewController = {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        return vc
    }()
    
    let viewController2: UIViewController = {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        return vc
    }()
    
    let viewController3: UIViewController = {
        let vc = ViewController()
        vc.view.backgroundColor = .orange
        return vc
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .lightGray
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.frame.size = CGSize()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = UIColor.init(white: 0.3, alpha: 0.3)
        return pageControl
    }()
    
    
    var viewControllerArray = [UIViewController]()
    
    
    override func viewDidLoad() {
        
       
        
        delegate = self
        dataSource = self
        
        view.addSubview(pageControl)
        
        viewControllerArray.append(viewController1)
        viewControllerArray.append(viewController2)
        viewControllerArray.append(viewController3)
        
        pageControl.numberOfPages = viewControllerArray.count
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": pageControl]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v(50)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": pageControl]))
        
      
        super.viewDidLoad()
        
        setViewControllers([viewControllerArray[0]], direction: .forward, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = self.viewControllerArray.index(of: viewController) {
            if index > 0 {
                return viewControllerArray[index - 1]
            }
        }
        return nil
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = self.viewControllerArray.index(of: viewController) {
            if index < viewControllerArray.count - 1  {
                return viewControllerArray[index + 1]
            }
        }

        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        pageControl.currentPage = viewControllerArray.index(of: (viewControllers?[0])!)!
    }


}
