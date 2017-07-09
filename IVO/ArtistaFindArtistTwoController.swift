//
//  ArtistaFindArtistTwoController.swift
//  IVO
//
//  Created by user on 11/21/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ArtistaFindArtistTwoController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
//    @IBOutlet weak var Country: UIPickerView!
    let listCountry = ["Colombia", "Venezuela"]
    let listResident = ["Caracas", "Cali"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return listCountry.count
        }
        else{
            return listResident.count
        }
        
    }
    
    func pickerView(_
        pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
        ) -> String? {
        if (pickerView.tag == 1){
            return listCountry[row]
        }
        else{
            return listResident[row]
        }
    }
    
    func pickerView(_
        pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int)
    {
        print("Hola")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
}
