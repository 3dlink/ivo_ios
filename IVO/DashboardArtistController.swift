//
//  DashboardArtistController.swift
//  IVO
//
//  Created by user on 12/17/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class DashboardArtistController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var VHeader: UIView!
    @IBOutlet weak var CVSlider: UICollectionView!
    @IBOutlet weak var tagsList: UICollectionView!
    @IBOutlet weak var VTagList: UIView!
    
    @IBOutlet weak var VTagListHeight: NSLayoutConstraint!
    
    @IBOutlet weak var titleTalents: UILabel!
    
    @IBOutlet weak var VTalents: UIView!
    @IBOutlet weak var CVTalents: UICollectionView!
    @IBOutlet weak var VTalentsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var controlPagina: UIPageControl!
    var timer = Timer()
    var currentItem: Int = 1
    
    var airports3: [String: [String: String]] = ["YYZ": ["id":"1", "name": "Toronto"]]
    //    var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    //    var airports3 = ["YYZ": ["id":"1", "name": "Toronto"]]
    
    var talens = [["name": "Leonardo Di Caprio", "tag": "ACTOR", "other":"Actuacion", "pic":"juanes.jpg"],["name": "Jhon Lennon", "tag": "CANTANTE", "other":"Compositor", "pic":"shakira.jpg"],["name":"Eminem", "tag":"CANTANTE", "other":"Compositos", "pic":"eminem.jpg"],["name": "Leonardo Di Caprio", "tag": "ACTOR", "other":"Actuacion", "pic":"juanes.jpg"],["name": "Jhon Lennon", "tag": "CANTANTE", "other":"Compositor", "pic":"shakira.jpg"],["name":"Eminem", "tag":"CANTANTE", "other":"Compositos", "pic":"eminem.jpg"],["name": "Leonardo Di Caprio", "tag": "ACTOR", "other":"Actuacion", "pic":"juanes.jpg"],["name": "Jhon Lennon", "tag": "CANTANTE", "other":"Compositor", "pic":"shakira.jpg"],["name":"Eminem", "tag":"CANTANTE", "other":"Compositos", "pic":"eminem.jpg"]]
    
    var filter: [[String : String]] = []
    
    var items = ["TODOS", "MÚSICO", "MODELO", "CANTANTE", "ACTOR", "BAILARIN", "EXTRA", "AZAFATA"]
    
    let names = ["Juan Esteban","Shakira", "Rihanna", "Eminem", "Enrique"]
    let pics = ["juanes.jpg", "shakira.jpg", "rihanna.jpg", "eminem.jpg", "Enrique.png"]
    let professions = ["Cantante", "Cantante", "Cantante","Cantante","Cantante"]
    
    @IBAction func filterTag(_ sender: AnyObject) {
        filter = [[String : String]]()
        if sender.title(for: .normal) != "TODOS" {
            for x in 0...talens.count - 1{
                if talens[x]["tag"] == sender.title(for: .normal){
                    filter.append(talens[x])
                }
            }
        }
        CVTalents.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startTimer()
        self.VTagListHeight.constant = CGFloat((items.count / 2) * 35)

        self.CVTalents.layoutIfNeeded()
        
        
        
        self.VTalentsHeight.constant = (CVTalents.frame.size.width / 2 + ( 90 )) * 2
        controlPagina.numberOfPages = Int(ceil(CGFloat(talens.count) / CGFloat(4)))

        
        
        //        self.cuadlito.autoresizingMask = UIViewAutoresizing.flexibleWidth
        
        //        print(">>>>>>")
        //        print(self.cuadlito.frame.size.width)
        //        super.viewDidLoad()
        //        print(CVTalents.frame.size.width)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        print(">>>>>>")
        //        print(cuadlito.frame.size.width)
        if(collectionView.tag == 1){
            return CGSize(width: VHeader.frame.size.width, height: VHeader.frame.size.height)
        }
        else if(collectionView.tag == 2){
            if(indexPath.item == 0 && items.count % 2 != 0){
                return CGSize(width: (VTagList.frame.size.width - 50), height: 30)
            }
            else{
                return CGSize(width: VTagList.frame.size.width / 2, height: 30)
            }
        }
        else{
            return CGSize(width: CVTalents.frame.size.width / 2, height: CVTalents.frame.size.width / 2 + ( 90 ))
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0,0.0,0.0,0.0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView.tag == 1){
            resetTimer()
            if(currentItem >= CVSlider.numberOfItems(inSection: 0)){
                CVSlider.setContentOffset(CGPoint.zero, animated: true)
                currentItem = 1
            }
            else{
                currentItem = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width)) + 1
            }
        }
        if (scrollView.tag == 3){
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            controlPagina.currentPage = Int(pageNumber)
        }
    }
    
    @IBAction func changPg(_ sender: AnyObject) {
        let x = CGFloat(controlPagina.currentPage) * CVTalents.frame.size.width
        CVTalents.setContentOffset(CGPoint(x:x, y:0), animated: true)
        controlPagina.currentPage = Int(controlPagina.currentPage)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return self.names.count
        }
        else if collectionView.tag == 2{
            return self.items.count
        }
        else{
            if filter.count == 0{
                return self.talens.count
            }
            else{
                return self.filter.count
            }
            
        }
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderArtist", for: indexPath as IndexPath) as! SliderArtist
            cell.name.text = self.names[indexPath.item]
            cell.picture.image = UIImage(named: self.pics[indexPath.item])
            cell.profession.text = self.professions[indexPath.item]
            return cell
        }
        else if collectionView.tag == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tagName", for: indexPath as IndexPath) as! TagArtist
            cell.tagName.setTitle(self.items[indexPath.item], for: .normal)
            return cell
            
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "talent", for: indexPath as IndexPath) as! TalentsGrid
            if (filter.count == 0){
                controlPagina.numberOfPages = Int(ceil(CGFloat(talens.count) / CGFloat(4)))
                titleTalents.text = "CONOCE A LOS TALENTOS MÁS RECIENTES"
                cell.talentTag.text = self.talens[indexPath.item]["tag"]
                cell.talentName.text = self.talens[indexPath.item]["name"]
                cell.talentOther.text = self.talens[indexPath.item]["other"]
                cell.talentPic.image = UIImage(named: self.talens[indexPath.item]["pic"]!)
            }
            else{
                controlPagina.numberOfPages = Int(ceil(CGFloat(filter.count) / CGFloat(4)))

                titleTalents.text = "CONOCE A LOS TALENTOS POR: " + self.filter[indexPath.item]["tag"]!
                cell.talentTag.text =  self.filter[indexPath.item]["tag"]
                cell.talentName.text = self.filter[indexPath.item]["name"]
                cell.talentOther.text = self.filter[indexPath.item]["other"]
                cell.talentPic.image = UIImage(named: self.filter[indexPath.item]["pic"]!)
            }
            return cell
        }
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func startTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 4, target:self, selector: #selector(DashboardArtistController.updateCounter), userInfo: nil, repeats: true)
    }
    
    func resetTimer(){
        timer.invalidate()
        startTimer()
    }
    
    func updateCounter() {
        if currentItem < CVSlider.numberOfItems(inSection: 0) {
            CVSlider.scrollToItem(at: NSIndexPath(item: currentItem, section: 0) as IndexPath, at:UICollectionViewScrollPosition.right, animated: true)
            self.currentItem += 1
        } else {
            CVSlider.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at:UICollectionViewScrollPosition.right, animated: true)
            self.currentItem = 1
        }
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
