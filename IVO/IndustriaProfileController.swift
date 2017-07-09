//
//  IndustriaProfileController.swift
//  IVO
//
//  Created by user on 11/22/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class IndustriaProfileController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextViewDelegate {

    @IBOutlet weak var ContainerCV: UIView!
    @IBOutlet weak var CastingCollection: UICollectionView!
    @IBOutlet weak var CView: UICollectionView!
    @IBOutlet weak var Interest: UILabel!
    @IBOutlet weak var Follow: UIButton!
    @IBOutlet weak var InterestScroll: UIScrollView!
    @IBOutlet weak var controlPagina: UIPageControl!
    @IBOutlet weak var Tags: UISegmentedControl!
    @IBOutlet weak var bioText: UITextView!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"]
    
    let reuseIdentifier2 = "castingCell"
    // also enter this string as the cell identifier in the storyboard
    
    var castings = [["type":"MÚSICA", "title":"Título del casting", "subtitle":"Subtítulo"], ["type":"MÚSICA", "title":"Título del casting2", "subtitle":"Subtítulo2"]]
    
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView.tag == 0){
            let picDimension = CView.frame.size.width / 3
            return CGSize(width: picDimension, height: picDimension)
        }
        else{
            let picDimension2 = CastingCollection.frame.size.width / 2
            return CGSize(width: picDimension2, height: CastingCollection.frame.size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (collectionView.tag == 0){
            return UIEdgeInsetsMake(-0.05,-0.05,-0.05,-0.05)
        }
        else{
            return UIEdgeInsetsMake(0.0,0.0,0.0,0.0)
        }
        

    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView.tag == 0){
            return self.items.count
        }
        else{
            return self.castings.count
        }
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView.tag == 0){
            // get a reference to our storyboard cell
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.layer.borderWidth = 2.0
//            cell.layer.borderColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            cell.myLabel.text = self.items[indexPath.item]
            return cell
        }
        else{
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath as IndexPath) as! CastingFromIndustry
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.layer.borderWidth = 2
//            cell.layer.borderColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
            cell.title.text = self.castings[indexPath.item]["title"]
            return cell
        }
        

    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        if (collectionView.tag == 0){
            print("You selected cell #\(indexPath.item)!")
        }
        else{
            print("You selected casting #\(indexPath.item)!")
        }
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(scrollView.tag)
        if(scrollView.tag == 0){
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            controlPagina.currentPage = Int(pageNumber)
        }
        
    }
    
    
    @IBAction func changPg(_ sender: AnyObject) {
        let x = CGFloat(controlPagina.currentPage) * CView.frame.size.width
        CView.setContentOffset(CGPoint(x:x, y:0), animated: true)
        controlPagina.currentPage = Int(controlPagina.currentPage)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bioText.setContentOffset(CGPoint.zero, animated: false)
    }
    
    func attributedString(from string: String, range: NSRange?) -> NSAttributedString {
        
        
        let myMutableString = NSMutableAttributedString(string: string)
        myMutableString.addAttribute(NSForegroundColorAttributeName,value: UIColor.black,range: range!)
        return myMutableString
    }
    
    override func viewDidLoad() {
        controlPagina.numberOfPages = Int(ceil(CGFloat(items.count) / CGFloat(9)))
        
        var attrSegment = NSDictionary()
        
//        let targetString = "Busto 85 cm"
//        let range = NSMakeRange(0, 5)
//        Bust.attributedText = attributedString(from: targetString, range: range)
//        
//        let targetString1 = "Cintura 60 cm"
//        let range1 = NSMakeRange(0, 7)
//        waist.attributedText = attributedString(from: targetString1, range: range1)
//        
//        let targetString2 = "Cadera 90 cm"
//        let range2 = NSMakeRange(0, 6)
//        hip.attributedText = attributedString(from: targetString2, range: range2)
//        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            attrSegment = NSDictionary(object: UIFont(name: "Exo-Regular", size: 10.0)!, forKey: NSFontAttributeName as NSCopying)
            break
        case .pad:
            attrSegment = NSDictionary(object: UIFont(name: "Exo-Regular", size: 24.0)!, forKey: NSFontAttributeName as NSCopying)
            break
        default:
            attrSegment = NSDictionary(object: UIFont(name: "Exo-Regular", size: 10.0)!, forKey: NSFontAttributeName as NSCopying)
            break
        }
        
        UISegmentedControl.appearance().setTitleTextAttributes(attrSegment as? [AnyHashable : Any], for: .normal)
        
        CView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        
        
        Follow.layer.borderWidth = 2
//        Follow.layer.borderColor = UIColor(displayP3Red: 0.0, green: 196.0, blue: 180.0, alpha: 1.0).cgColor
        
        //        Musica
        let int1 = UIImageView(frame: CGRect(x:40,y:10, width: 40,height:40))
        int1.image = UIImage(named:"Music.png")
        let labelMusica = UILabel(frame: CGRect(x:40, y:55, width:100, height:20))
        labelMusica.textAlignment = NSTextAlignment.center
        labelMusica.numberOfLines = 2
        labelMusica.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelMusica.font = UIFont(name: "Exo-Regular", size: 14.0)
        labelMusica.textColor = UIColor.white
        labelMusica.text = "Musica"
        labelMusica.sizeToFit()
        InterestScroll.addSubview(int1)
        InterestScroll.addSubview(labelMusica)
        
        
        //        Conciertos y Eventos
        let int2 = UIImageView(frame: CGRect(x:150,y:10, width: 40,height:40))
        int2.image = UIImage(named:"Concert.png")
        let labelCyE = UILabel(frame: CGRect(x:130, y:55, width:100, height:20))
        labelCyE.textAlignment = NSTextAlignment.center
        labelCyE.numberOfLines = 2
        labelCyE.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelCyE.font = UIFont(name: "Exo-Regular", size: 14.0)
        labelCyE.textColor = UIColor.white

        labelCyE.text = "Conciertos y Eventos"
        labelCyE.sizeToFit()
        InterestScroll.addSubview(int2)
        InterestScroll.addSubview(labelCyE)
        
        //        Disc
        let int3 = UIImageView(frame: CGRect(x:260,y:10, width: 40,height:40))
        int3.image = UIImage(named:"Disc.png")
        let labelDisc = UILabel(frame: CGRect(x:252, y:55, width:100, height:20))
        labelDisc.textAlignment = NSTextAlignment.center
        labelDisc.numberOfLines = 2
        labelDisc.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelDisc.font = UIFont(name: "Exo-Regular", size: 14.0)
        labelDisc.textColor = UIColor.white

        labelDisc.text = "Industria Musical"
        labelDisc.sizeToFit()
        InterestScroll.addSubview(int3)
        InterestScroll.addSubview(labelDisc)
        
        //        Fotografia
        let int4 = UIImageView(frame: CGRect(x:370,y:10, width: 50,height:35))
        int4.image = UIImage(named:"Picture.png")
        let labelPic = UILabel(frame: CGRect(x:360, y:55, width:100, height:20))
        labelPic.textAlignment = NSTextAlignment.center
        labelPic.numberOfLines = 2
        labelPic.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelPic.font = UIFont(name: "Exo-Regular", size: 14.0)
        labelPic.textColor = UIColor.white

        labelPic.text = "Fotografia"
        labelPic.sizeToFit()
        InterestScroll.addSubview(int4)
        InterestScroll.addSubview(labelPic)
        
        
        InterestScroll.contentSize = CGSize( width: (InterestScroll.frame.width/10) + 350, height: InterestScroll.frame.height/10)
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated:false);
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
