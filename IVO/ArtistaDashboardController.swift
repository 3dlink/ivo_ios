//
//  ArtistaDashboardController.swift
//  IVO
//
//  Created by user on 12/30/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ArtistaDashboardController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var talents = ["1", "2", "3"]
    var provider = ["1", "2", "3"]
    var followers = ["1", "2"]
    var following = ["1", "2"]

    @IBOutlet weak var TitleCastingHeight: NSLayoutConstraint!
    @IBOutlet weak var TitleCastingWidth: NSLayoutConstraint!
    @IBOutlet weak var TitleProviderHeight: NSLayoutConstraint!
    @IBOutlet weak var TitleProviderWidth: NSLayoutConstraint!
    
    @IBOutlet weak var VArtist: UIView!
    @IBOutlet weak var VArtistHeight: NSLayoutConstraint!
    @IBOutlet weak var CVArtist: UICollectionView!
    
    @IBOutlet weak var VProvider: UIView!
    @IBOutlet weak var CVProvider: UICollectionView!
    @IBOutlet weak var VProviderHeight: NSLayoutConstraint!
    
    @IBOutlet weak var VFollowers: UIView!
    @IBOutlet weak var CVFollowers: UICollectionView!
    @IBOutlet weak var VFollowersHeight: NSLayoutConstraint!
    
    @IBOutlet weak var VFollowing: UIView!
    @IBOutlet weak var CVFollowing: UICollectionView!
    @IBOutlet weak var VFollowingHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        
        
        if ( UIDevice.current.userInterfaceIdiom == .pad ) {
            
            self.TitleCastingHeight.constant = 45
            self.TitleCastingWidth.constant = 160
            
            self.TitleProviderHeight.constant = 45
            self.TitleProviderWidth.constant = 260
                
            self.VArtist.layoutIfNeeded()
            self.VArtistHeight.constant = 220 * 3
            
            self.VProvider.layoutIfNeeded()
            self.VProviderHeight.constant = VProvider.frame.size.width / 3 + ( 100 )
            
            self.VFollowers.layoutIfNeeded()
            self.VFollowersHeight.constant = VFollowers.frame.size.width / 2 + ( 102 )
            
            self.VFollowing.layoutIfNeeded()
            self.VFollowingHeight.constant = VFollowing.frame.size.width / 2 + ( 102 )
        }
        else{
            self.VArtist.layoutIfNeeded()
            self.VArtistHeight.constant = 110 * 3
            
            self.VProvider.layoutIfNeeded()
            self.VProviderHeight.constant = VProvider.frame.size.width / 3 + ( 90 )
            
            self.VFollowers.layoutIfNeeded()
            self.VFollowersHeight.constant = VFollowers.frame.size.width / 2 + ( 51 )
            
            self.VFollowing.layoutIfNeeded()
            self.VFollowingHeight.constant = VFollowing.frame.size.width / 2 + ( 51 )
        }
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if ( UIDevice.current.userInterfaceIdiom == .pad ) {
            if collectionView.tag == 1 {
                return CGSize(width: VArtist.frame.size.width, height: 220)
            }
            else if collectionView.tag == 2{
                return CGSize(width: VProvider.frame.size.width / 3, height: (VProvider.frame.size.width / 3) + 100 )
            }
            else{
                return CGSize(width: VFollowers.frame.size.width / 2, height: (VFollowers.frame.size.width / 2) + 102 )
                
            }
        }
        else{
            if collectionView.tag == 1 {
                return CGSize(width: VArtist.frame.size.width, height: 110)
            }
            else if collectionView.tag == 2{
                return CGSize(width: VProvider.frame.size.width / 3, height: (VProvider.frame.size.width / 3) + 71 )
            }
            else{
                return CGSize(width: VFollowers.frame.size.width / 2, height: (VFollowers.frame.size.width / 2) + 51 )
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(-0.05,-0.05,-0.05,-0.05)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return self.talents.count
        }
        else if collectionView.tag == 2{
            return self.provider.count
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
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "talent", for: indexPath as IndexPath) as! ArtistGridList
            
            if ( UIDevice.current.userInterfaceIdiom == .pad ) {
                cell.LTagHeight.constant = 30
                cell.BReadMoreHeight.constant = 25
                cell.BReadMoreWidth.constant = 150
            }
            
            cell.content.text = "MÚSICA"
            
            return cell
        }
        else if collectionView.tag == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "provider", for: indexPath as IndexPath) as! TalentsGrid
            cell.talentName.text = "Catherine Lewis"
            if ( UIDevice.current.userInterfaceIdiom == .pad ) {
                cell.LTalentTagHeight.constant = 24
                cell.LTalentNameHeight.constant = 34
                cell.LTalentOtherHeight.constant = 34
            }
            return cell
        }
        else if collectionView.tag == 3{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "follower", for: indexPath as IndexPath) as! FollowGrid
            if ( UIDevice.current.userInterfaceIdiom == .pad ) {
                cell.LFollowTagHeight.constant = 35
                cell.LFollowNameHeight.constant = 35
                cell.LFollowOtherHeight.constant = 35
            }
            cell.followName.text = "Music Records"
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "following", for: indexPath as IndexPath) as! FollowGrid
            if ( UIDevice.current.userInterfaceIdiom == .pad ) {
                cell.LFollowTagHeight.constant = 35
                cell.LFollowNameHeight.constant = 35
                cell.LFollowOtherHeight.constant = 35
            }
            cell.followName.text = "Music Records"
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

