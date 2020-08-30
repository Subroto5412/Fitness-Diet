//
//  FADPageViewController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 15/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
protocol FADPageViewControllerDelegate: class {
    
    func didSelectedController(type: Int)
}

class FADPageViewController: UIPageViewController {

     weak var selectionDelegate: FADPageViewControllerDelegate?
     var subViewControllers = [UIViewController]()
     var selectedIndex : Int = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.delegate = self
            self.dataSource = self
            self.showViewController(at: self.selectedIndex)
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            if let pageScrollView = view.subviews.first {
                pageScrollView.frame = view.bounds
            }
        }
        
        func setSubViewControllers(controllers:[UIViewController]) {
            subViewControllers.removeAll()
            subViewControllers.append(contentsOf: controllers)
        }
        
        func showViewController(at controllerIndex:Int) {
            self.setViewControllers([subViewControllers[controllerIndex]], direction: .forward, animated: false, completion: nil)
        }
        
        func updateSelectedControllerIndex(withSelectedIndex currentIndex:Int)  {
            
            self.selectedIndex = currentIndex
            self.selectionDelegate?.didSelectedController(type: self.selectedIndex)
            
        }
        
    }

    extension FADPageViewController : UIPageViewControllerDataSource {
        
        func presentationIndex(for pageViewController: UIPageViewController) -> Int {
            
            var currentIndex = 0
            if let currentVC = self.viewControllers!.first {
                if let indexOfController = subViewControllers.index(of: currentVC) {
                    currentIndex = indexOfController
                }
            }
            self.updateSelectedControllerIndex(withSelectedIndex: currentIndex)
            return currentIndex
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            
            let currentIndex : Int = subViewControllers.lastIndex(of: viewController) ?? 0
            if currentIndex <= 0 {
                return nil
            }
            return subViewControllers[currentIndex-1]
            
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            
            let currentIndex : Int = subViewControllers.lastIndex(of: viewController) ?? 0
            if currentIndex >= subViewControllers.count - 1 {
                return nil
            }
            return subViewControllers[currentIndex+1]
        }
        
        func presentationCount(for pageViewController: UIPageViewController) -> Int {
            return subViewControllers.count
        }
    }


    extension FADPageViewController : UIPageViewControllerDelegate {
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            
            if completed {
                
                if let currentViewController = pageViewController.viewControllers?[0] {
                    
                    let currentIndex : Int = subViewControllers.lastIndex(of: currentViewController) ?? 0
                    self.updateSelectedControllerIndex(withSelectedIndex: currentIndex)
                   
                }
            }
            
        }
    }

