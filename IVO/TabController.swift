//
//  TabController.swift
//  IVO
//
//  Created by user on 11/14/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import UIKit

class TabController: UITabBarController, UITabBarControllerDelegate {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if(item.title! == "Notificaciones"){
            self.tabBar.items![3].badgeValue = nil
        }
    }
    
    override func viewDidLoad() {
        self.delegate = self
        self.selectedIndex = 2;
        self.tabBar.items![3].badgeValue = "3"
    
        
        super.viewDidLoad()
        
//        self.tabBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 250.0)

//        let font = UIFont.systemFont(ofSize: 30);
//        self.tabBar.items![1].setTitleTextAttributes([NSFontAttributeName: font], for:UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        if ( UIDevice.current.userInterfaceIdiom == .pad ) {

            self.tabBar.frame.size.height = 80.0
            self.tabBar.frame.origin.y = self.view.frame.size.height - 80
            let font = UIFont.systemFont(ofSize: 20);
            self.tabBar.items![0].setTitleTextAttributes([NSFontAttributeName: font], for:UIControlState.normal)
            self.tabBar.items![1].setTitleTextAttributes([NSFontAttributeName: font], for:UIControlState.normal)
            self.tabBar.items![2].setTitleTextAttributes([NSFontAttributeName: font], for:UIControlState.normal)
            self.tabBar.items![3].setTitleTextAttributes([NSFontAttributeName: font], for:UIControlState.normal)
            self.tabBar.items![4].setTitleTextAttributes([NSFontAttributeName: font], for:UIControlState.normal)
        
        }
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
