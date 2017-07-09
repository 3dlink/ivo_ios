//
//  ProveedorDashboardController.swift
//  IVO
//
//  Created by user on 12/27/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ProveedorDashboardController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var newTalents = [["name":"Catherine Lewis", "pic": "Pic1.png", "tag":"CANTANTE", "other": "Cantautor"],["name":"Catherine Lewis", "pic": "Pic2.png", "tag":"MODELO", "other": "Fashion"],["name":"Catherine Lewis", "pic": "Pic3.png", "tag":"ARTISTA", "other": "Pintor"],["name":"Catherine Lewis", "pic": "Pic1.png", "tag":"CANTANTE", "other": "Cantautor"],["name":"Catherine Lewis", "pic": "Pic2.png", "tag":"BAILARÍN", "other": "Danza"],["name":"Catherine Lewis", "pic": "Pic3.png", "tag":"MODELO", "other": "Catálago"]]
    
    var industry = [["name":"Catherine Lewis", "pic": "Pic1.png", "tag":"AGENCIAS", "other": "Publicidad"],["name":"Catherine Lewis", "pic": "Pic2.png", "tag":"DIRECTORES", "other": "Cine Documental"],["name":"Catherine Lewis", "pic": "Pic3.png", "tag":"PRODUCTORES", "other": "Producción de eventos"]]
    
    var followers = [ ["name":"Music Records INC ONG","tag":"MÚSICA", "pic":"", "other":"Producción de Eventos"],["name":"Music Records","tag":"MÚSICA", "pic":"", "other":"Producción de Eventos"]]
    
    var following = [ ["name":"Music Records","tag":"MÚSICA", "pic":"", "other":"Producción de Eventos"],["name":"Music Records","tag":"MÚSICA", "pic":"", "other":"Producción de Eventos"]]
    
    @IBOutlet weak var VArtist: UIView!
    @IBOutlet weak var VArtistHeight: NSLayoutConstraint!
    @IBOutlet weak var CVArtist: UICollectionView!
    
    @IBOutlet weak var VIndustry: UIView!
    @IBOutlet weak var CVIndustry: UICollectionView!
    @IBOutlet weak var VIndustryHeight: NSLayoutConstraint!
    
    @IBOutlet weak var VFollowers: UIView!
    @IBOutlet weak var CVFollowers: UICollectionView!
    @IBOutlet weak var VFollowersHeight: NSLayoutConstraint!
    
    @IBOutlet weak var VFollowing: UIView!
    @IBOutlet weak var CVFollowing: UICollectionView!
    @IBOutlet weak var VFollowingHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.VArtist.layoutIfNeeded()
        self.VArtistHeight.constant = (VArtist.frame.size.width / 3 + ( 64 )) * 2
        
        self.VIndustry.layoutIfNeeded()
        self.VIndustryHeight.constant = VIndustry.frame.size.width / 3 + ( 64 )
        
        self.VFollowers.layoutIfNeeded()
        self.VFollowersHeight.constant = VFollowers.frame.size.width / 2 + ( 51 )
        
        self.VFollowing.layoutIfNeeded()
        self.VFollowingHeight.constant = VFollowing.frame.size.width / 2 + ( 51 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 || collectionView.tag == 2{
            return CGSize(width: VArtist.frame.size.width / 3, height: (VArtist.frame.size.width / 3) + 64 )
        }
        else{
            return CGSize(width: VFollowers.frame.size.width / 2, height: (VFollowers.frame.size.width / 2) + 51 )

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(-0.05,-0.05,-0.05,-0.05)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return self.newTalents.count
        }
        else if collectionView.tag == 2{
            return self.industry.count
        }
        else if collectionView.tag == 3{
            return self.followers.count
        }
        else{
            return self.following.count
        }
        
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "talent", for: indexPath as IndexPath) as! TalentsGrid
            cell.talentName.text = newTalents[indexPath.item]["name"]
            cell.talentTag.text = newTalents[indexPath.item]["tag"]
            cell.talentOther.text = newTalents[indexPath.item]["other"]
            cell.talentPic.image = UIImage(named: newTalents[indexPath.item]["pic"]!)
            return cell
        }
        else if collectionView.tag == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "industry", for: indexPath as IndexPath) as! TalentsGrid
            cell.talentName.text = industry[indexPath.item]["name"]
            cell.talentTag.text = industry[indexPath.item]["tag"]
            cell.talentOther.text = industry[indexPath.item]["other"]
            cell.talentPic.image = UIImage(named: industry[indexPath.item]["pic"]!)
            return cell
        }
        else if collectionView.tag == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "follower", for: indexPath as IndexPath) as! FollowGrid
            cell.followName.text = followers[indexPath.item]["name"]
            cell.followTag.text = followers[indexPath.item]["tag"]
            cell.followOther.text = followers[indexPath.item]["other"]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "following", for: indexPath as IndexPath) as! FollowGrid
            
            cell.followName.text = following[indexPath.item]["name"]
            cell.followTag.text = following[indexPath.item]["tag"]
            cell.followOther.text = following[indexPath.item]["other"]

            return cell
        }
//        
    }

    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
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
