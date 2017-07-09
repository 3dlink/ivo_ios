//
//  DashboardArtistController.swift
//  IVO
//
//  Created by user on 12/17/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class DashboardCastingController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var VHeader: UIView!
    @IBOutlet weak var CVSlider: UICollectionView!

    @IBOutlet weak var VTagCasting: UIView!
    @IBOutlet weak var CVCasting: UICollectionView!
    @IBOutlet weak var VCastingHeight: NSLayoutConstraint!
    
    @IBOutlet weak var VCastingGrid: UIView!
    @IBOutlet weak var CVCastingGrid: UICollectionView!
//    @IBOutlet weak var tagsList: UICollectionView!
//    @IBOutlet weak var VTagList: UIView!
//    @IBOutlet weak var VTagListHeight: NSLayoutConstraint!
//    
//    @IBOutlet weak var titleTalents: UILabel!
//    
//    @IBOutlet weak var VTalents: UIView!
//    @IBOutlet weak var CVTalents: UICollectionView!
//    @IBOutlet weak var VTalentsHeight: NSLayoutConstraint!
//    
//    @IBOutlet weak var controlPagina: UIPageControl!
    var timer = Timer()
    var currentItem: Int = 1
    var tags = ["AGENCIAS DE PUBLICIDAD", "PRODUCTORAS", "AGENCIAS DE CASTING", "CLIENTES", "AGENCIAS DE MODELAJE", "MANAGER", "INDEPENDIENTES", "INSTITUCIONES"]
    var slider = [["pic":"casting.png", "titulo":"Haz tu audicion", "subtitulo":"Demuestra tu talento"]]
    var castingGrid = [["name":"beta1", "color": "red"],["name":"beta2", "color": "blue"],["name":"beta3", "color": "white"],["name":"beta4", "color": "red"],["name":"beta5", "color": "blue"],["name":"beta6", "color": "white"]]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return slider.count
        }
        if collectionView.tag == 2{
            return tags.count
        }
        if collectionView.tag == 3{
            return castingGrid.count
        }
         return slider.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCasting", for: indexPath as IndexPath) as! SliderCasting
            
            cell.titleCasting.text = self.slider[indexPath.item]["titulo"]
            cell.subtitleCasting.text = self.slider[indexPath.item]["subtitulo"]
            cell.picCasting.image = UIImage(named:self.slider[indexPath.item]["pic"]!)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "castingGrid", for: indexPath as IndexPath) as! CastingGrid
                cell.viewCasting.setTitle(castingGrid[indexPath.item]["name"], for: .normal)
            if indexPath.item == 0{
                cell.backgroundColor = UIColor.white
            }
            else if indexPath.item == 1{
                cell.backgroundColor = UIColor.green
            }
            else if indexPath.item == 2{
                cell.backgroundColor = UIColor.brown
            }
            else if indexPath.item == 3{
                cell.backgroundColor = UIColor.yellow
            }
            else{
                cell.backgroundColor = UIColor.blue
            }
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagCasting", for: indexPath as IndexPath) as! TagCasting
            cell.nameTag.setTitle(tags[indexPath.item], for: .normal)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView.tag == 1){
            return CGSize(width: VHeader.frame.size.width, height: VHeader.frame.size.height)
        }
        else if(collectionView.tag == 2){
            if(indexPath.item == 0 && tags.count % 2 != 0){
                return CGSize(width: (VTagCasting.frame.size.width - 50), height: 30)
            }
            else{
                return CGSize(width: VTagCasting.frame.size.width / 2, height: 30)
            }
        }
        else{
            print(VCastingGrid.frame.size.width);
//            if(indexPath.item != 0 && (indexPath.item + 1) % 3 == 0){
//                return CGSize(width: VCastingGrid.frame.size.width, height: VCastingGrid.frame.size.height / 3)
//            }
//            else{
                return CGSize(width: VCastingGrid.frame.size.width / 2, height: VCastingGrid.frame.size.height / 3)
//            }
        }
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsetsMake(-0.5,-0.5,-0.5,-0.5)
        }
    
//    var items = ["TODOS", "MÚSICO", "MODELO", "CANTANTE", "ACTOR", "BAILARIN", "EXTRA", "AZAFATA"]
//    
//    let names = ["Juan Esteban","Shakira", "Rihanna", "Eminem", "Enrique"]
//    let pics = ["juanes.jpg", "shakira.jpg", "rihanna.jpg", "eminem.jpg", "Enrique.png"]
//    let professions = ["Cantante", "Cantante", "Cantante","Cantante","Cantante"]
//    
//    @IBAction func filterTag(_ sender: AnyObject) {
//        filter = [[String : String]]()
//        if sender.title(for: .normal) != "TODOS" {
//            for x in 0...talens.count - 1{
//                if talens[x]["tag"] == sender.title(for: .normal){
//                    filter.append(talens[x])
//                }
//            }
//        }
//        CVTalents.reloadData()
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.startTimer()
//        self.VTagListHeight.constant = CGFloat((items.count / 2) * 35)
//        
//        self.CVTalents.layoutIfNeeded()
//        
//        controlPagina.numberOfPages = Int(ceil(CGFloat(talens.count) / CGFloat(4)))
//        
//        
//        self.VTalentsHeight.constant = (CVTalents.frame.size.width / 2 + ( 90 )) * 2
//        //
//        
//        
//        //        self.cuadlito.autoresizingMask = UIViewAutoresizing.flexibleWidth
//        
//        //        print(">>>>>>")
//        //        print(self.cuadlito.frame.size.width)
//        //        super.viewDidLoad()
//        //        print(CVTalents.frame.size.width)
//        
//    }
//    

//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsetsMake(0.0,0.0,0.0,0.0)
//    }
//    
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        if (scrollView.tag == 1){
//            resetTimer()
//            if(currentItem >= CVSlider.numberOfItems(inSection: 0)){
//                CVSlider.setContentOffset(CGPoint.zero, animated: true)
//                currentItem = 1
//            }
//            else{
//                currentItem = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width)) + 1
//            }
//        }
//        if (scrollView.tag == 3){
//            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
//            controlPagina.currentPage = Int(pageNumber)
//        }
//    }
//    
//    @IBAction func changPg(_ sender: AnyObject) {
//        let x = CGFloat(controlPagina.currentPage) * CVTalents.frame.size.width
//        CVTalents.setContentOffset(CGPoint(x:x, y:0), animated: true)
//        controlPagina.currentPage = Int(controlPagina.currentPage)
//    }
//
//    
//    // MARK: - UICollectionViewDelegate protocol
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        // handle tap events
//        print("You selected cell #\(indexPath.item)!")
//    }
//    
//    func startTimer(){
//        self.timer = Timer.scheduledTimer(timeInterval: 4, target:self, selector: #selector(DashboardArtistController.updateCounter), userInfo: nil, repeats: true)
//    }
//    
//    func resetTimer(){
//        timer.invalidate()
//        startTimer()
//    }
//    
//    func updateCounter() {
//        if currentItem < CVSlider.numberOfItems(inSection: 0) {
//            CVSlider.scrollToItem(at: NSIndexPath(item: currentItem, section: 0) as IndexPath, at:UICollectionViewScrollPosition.right, animated: true)
//            self.currentItem += 1
//        } else {
//            CVSlider.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at:UICollectionViewScrollPosition.right, animated: true)
//            self.currentItem = 1
//        }
//    }
//    
//    
        override func viewDidLoad() {
            super.viewDidLoad()
//            self.startTimer()
//            self.VTagListHeight.constant = CGFloat((items.count / 2) * 35)
    
//            self.CVTalents.layoutIfNeeded()
    
//            controlPagina.numberOfPages = Int(ceil(CGFloat(talens.count) / CGFloat(4)))
    
    
//            self.VTalentsHeight.constant = (CVTalents.frame.size.width / 2 + ( 90 )) * 2
            //
    
    
            //        self.cuadlito.autoresizingMask = UIViewAutoresizing.flexibleWidth
    
            //        print(">>>>>>")
            //        print(self.cuadlito.frame.size.width)
            //        super.viewDidLoad()
            //        print(CVTalents.frame.size.width)
            
        }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
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
