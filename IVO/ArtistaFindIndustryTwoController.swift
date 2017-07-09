//
//  ArtistaFindTwoController.swift
//  IVO
//
//  Created by user on 11/21/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ArtistaFindIndustryTwoController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
//    @IBOutlet weak var country: UIPickerView!
//    @IBOutlet weak var city: UIPickerView!

    
    var pickerData = ["Argentina", "Brasil", "Colombia", "Venezuela"]
    
    var pickerData2 = ["Caracas", "Maracaibo", "Valencia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return pickerData.count
        }else{
            return pickerData2.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return pickerData[row]
        }else{
            return pickerData2[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView.tag == 1){
            print(self.pickerData[row])
        }
        else{
            print(self.pickerData2[row])
        }
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Atras", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.navigationController!.navigationBar.isHidden = false
        self.navigationController!.navigationBar.tintColor = UIColor.white
        
        let view = UIView(frame: CGRect(x:0, y:0, width:25, height:25))
        view.backgroundColor = UIColor.black
        let barButtonItem = UIBarButtonItem(customView: view)
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        let image = UIImage(named: "LogoTop.png")
        imageView.image = image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
