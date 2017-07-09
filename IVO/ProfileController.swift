//
//  RegisterController.swift
//  IVO
//
//  Created by user on 9/27/16.
//  Copyright © 2016 3dlink. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //    @IBOutlet weak var ScrollView: UIScrollView!

    @IBOutlet weak var VTopInterest: NSLayoutConstraint!
    @IBOutlet weak var SVInterestHeight: NSLayoutConstraint!
    @IBOutlet weak var VInterestHeight: NSLayoutConstraint!
    
    @IBOutlet weak var VInterestTagWidth: NSLayoutConstraint!
    @IBOutlet weak var VInterestTagHeight: NSLayoutConstraint!
    
    @IBOutlet weak var BTwitterWidth: NSLayoutConstraint!
    @IBOutlet weak var BTwitterHeight: NSLayoutConstraint!
//    @IBOutlet weak var sad: UITextView!
    @IBOutlet weak var ContainerCV: UIView!
    @IBOutlet weak var Interest: UILabel!
    @IBOutlet weak var Follow: UIButton!
    @IBOutlet weak var InterestScroll: UIScrollView!
    @IBOutlet weak var controlPagina: UIPageControl!
    @IBOutlet weak var Tabs: UISegmentedControl!
    @IBOutlet weak var bioText: UITextView!
    
    @IBOutlet weak var Bust: UILabel!
    @IBOutlet weak var hip: UILabel!
    @IBOutlet weak var waist: UILabel!
    @IBOutlet weak var tatooSwitch: UISwitch!
    @IBOutlet weak var travelSwitch: UISwitch!
    @IBOutlet weak var travelLabel: UILabel!
    @IBOutlet weak var tatooLabel: UILabel!
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var TVAudios: UITableView!
    @IBOutlet weak var CVFotos: UICollectionView!
    @IBOutlet weak var VExperiences: UIView!
    
    @IBOutlet weak var modalNetworks: UIView!
    @IBOutlet weak var facebookUrl: UITextField!
    @IBOutlet weak var twitterUrl: UITextField!
    @IBOutlet weak var instagramUrl: UITextField!
    @IBOutlet weak var webUrl: UITextField!
    
    @IBOutlet weak var buttonTwitter: UIButton!
    @IBOutlet weak var buttonInstagram: UIButton!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonWeb: UIButton!
    
    @IBOutlet weak var visasSwitch: UISwitch!
    @IBOutlet weak var visasLabel: UILabel!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var agency: UITextField!
    @IBOutlet weak var passport: UILabel!
    
    
    @IBOutlet weak var pencilBio: UIButton!
    @IBOutlet weak var pencilInfo: UIButton!
    @IBOutlet weak var pencilInfoCompany: UIButton!
    
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"]
    
    var items2 = ["1", "2", "3", "4", "5", "6", "7", "4", "5", "6", "7", "4", "5", "6", "7"]
    
    @IBAction func travelEdit(_ sender: AnyObject) {
        if travelSwitch.isOn{
            travelLabel.text = "Si"
        }
        else{
            travelLabel.text = "No"
        }
    }
    
    @IBAction func tatooEdit(_ sender: AnyObject) {
        if tatooSwitch.isOn{
            tatooLabel.text = "Si"
        }
        else{
            tatooLabel.text = "No"
        }
    }
    
    @IBAction func visasEdit(_ sender: AnyObject) {
        if visasSwitch.isOn{
            visasLabel.text = "Si"
        }
        else{
            visasLabel.text = "No"
        }
    }
    
    @IBAction func editUrl(_ sender: AnyObject) {
        modalNetworks.isHidden = false
    }
    @IBAction func changeTab(_ sender: UISegmentedControl) {
        switch Tabs.selectedSegmentIndex
        {
        case 0:
            CVFotos.isHidden = false
            TVAudios.isHidden = true
            VExperiences.isHidden = true
            controlPagina.isHidden = false
        case 1:
            CVFotos.isHidden = true
            TVAudios.isHidden = false
            VExperiences.isHidden = true
            controlPagina.isHidden = true
        case 2:
            CVFotos.isHidden = false
            TVAudios.isHidden = true
            VExperiences.isHidden = true
            controlPagina.isHidden = false
        case 3:
            CVFotos.isHidden = true
            TVAudios.isHidden = true
            VExperiences.isHidden = false
            controlPagina.isHidden = true
        default:
            break;
        }
    }
    
    @IBAction func editNetworks(_ sender: AnyObject) {
        if(facebookUrl.text==""){
            buttonFacebook.isEnabled = false
        }
        else{
            buttonFacebook.isEnabled = true
        }
        if(twitterUrl.text == ""){
            buttonTwitter.isEnabled = false
        }
        else{
            buttonTwitter.isEnabled = true
        }
        if(instagramUrl.text == ""){
            buttonInstagram.isEnabled = false
        }
        else{
            buttonInstagram.isEnabled = true
        }
        if(webUrl.text == ""){
            buttonWeb.isEnabled = false
            buttonWeb.setTitle("", for: .normal)
        }
        else{
            buttonWeb.isEnabled = true
            buttonWeb.setTitle("Web Oficial", for: .normal)
        }
        modalNetworks.isHidden = true
    }
    

    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let picDimension = CVFotos.frame.size.width / 3
        return CGSize(width: picDimension, height: picDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(-0.05,-0.05,-0.05,-0.05)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.layer.borderWidth = 2.0
//            cell.layer.borderColor = UIColor(displayP3Red: 239.0, green: 239.0, blue: 239.0, alpha: 0.5).cgColor
            cell.myLabel.text = self.items[indexPath.item]
            return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "audios", for: indexPath as IndexPath) as! AudioCellArtist
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.nameSound.text = "Nombre del audio"
        
        if ( indexPath.row % 2 == 0 ){
            cell.backgroundColor = UIColor(red: 212/255, green: 212/255, blue: 212/255, alpha: 1.0)
        }
        else{
            cell.backgroundColor = UIColor(red: 191/255, green: 190/255, blue: 190/255, alpha: 1.0)
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        controlPagina.currentPage = Int(pageNumber)
    }

    @IBAction func editBio(_ sender: AnyObject) {
        
        if(bioText.isEditable){
            let img = UIImage(named:"pencilEdit.png")
            pencilBio.setBackgroundImage(img, for: .normal)
            bioText.isEditable = false
            bioText.backgroundColor = UIColor.clear
        }
        else{
            let img = UIImage(named:"saveArtist.png")
            pencilBio.setBackgroundImage(img, for: .normal)
            bioText.isEditable = true
            bioText.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func changPg(_ sender: AnyObject) {
        let x = CGFloat(controlPagina.currentPage) * CVFotos.frame.size.width
        CVFotos.setContentOffset(CGPoint(x:x, y:0), animated: true)
        controlPagina.currentPage = Int(controlPagina.currentPage)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bioText.setContentOffset(CGPoint.zero, animated: false)
        
    }
   
    @IBAction func editInfo(_ sender: AnyObject) {
        if(travelSwitch.isHidden){
            travelSwitch.isHidden = false
            tatooSwitch.isHidden = false
            travelLabel.isHidden = true
            tatooLabel.isHidden = true
            height.isEnabled = true
            height.backgroundColor = UIColor.white
            let img = UIImage(named:"saveArtistTwo.png")
            pencilInfo.setBackgroundImage(img, for: .normal)

        }
        else{
            travelSwitch.isHidden = true
            tatooSwitch.isHidden = true
            travelLabel.isHidden = false
            tatooLabel.isHidden = false
            height.isEnabled = false
            height.backgroundColor = UIColor.clear
            let img = UIImage(named:"pencilEditGreen.png")
            pencilInfo.setBackgroundImage(img, for: .normal)
        }
    }
    
    @IBAction func editInfoCompany(_ sender: AnyObject) {
        if(visasSwitch.isHidden){
            visasSwitch.isHidden = false
            visasLabel.isHidden = true
            phone.isEnabled = true
            phone.backgroundColor = UIColor.white
            agency.isEnabled = true
            agency.backgroundColor = UIColor.white
            passport.isEnabled = true
            passport.backgroundColor = UIColor.white
            let img = UIImage(named:"saveArtistTwo.png")
            pencilInfoCompany.setBackgroundImage(img, for: .normal)
        }
        else{
            visasSwitch.isHidden = true
            visasLabel.isHidden = false
            phone.isEnabled = false
            phone.backgroundColor = UIColor.clear
            agency.isEnabled = false
            agency.backgroundColor = UIColor.clear
            passport.isEnabled = false
            passport.backgroundColor = UIColor.clear
            let img = UIImage(named:"pencilEditGreen.png")
            pencilInfoCompany.setBackgroundImage(img, for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        travelSwitch.isHidden = true
        tatooSwitch.isHidden = true
        visasSwitch.isHidden = true
        travelSwitch.transform = CGAffineTransform(scaleX: 0.5, y: 0.5);
        tatooSwitch.transform = CGAffineTransform(scaleX: 0.5, y: 0.5);
        visasSwitch.transform = CGAffineTransform(scaleX: 0.4, y: 0.4);

//        var countries: [String] = []
//        
//        for code in NSLocale.isoCountryCodes as [String] {
//            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
//            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
//            countries.append(name)
//        }
//        
//        print(countries)
        
        
        TVAudios.isHidden = true
        modalNetworks.isHidden = true
        VExperiences.isHidden = true

        controlPagina.numberOfPages = Int(ceil(CGFloat(items.count) / CGFloat(9)))
        
        var attrSegment = NSDictionary()

        let targetString = "Busto 85 cm"
        let range = NSMakeRange(0, 5)
        Bust.attributedText = attributedString(from: targetString, range: range)
        
        let targetString1 = "Cintura 60 cm"
        let range1 = NSMakeRange(0, 7)
        waist.attributedText = attributedString(from: targetString1, range: range1)
        
        let targetString2 = "Cadera 90 cm"
        let range2 = NSMakeRange(0, 6)
        hip.attributedText = attributedString(from: targetString2, range: range2)
        
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

        CVFotos.autoresizingMask = UIViewAutoresizing.flexibleWidth
        
        
        Follow.layer.borderWidth = 2
        let inter = [ ["name":"Musica", "icon": "Music.png"], ["name":"Conciertos y Eventos", "icon": "Concert.png"], ["name":"Industria Musical", "icon":"Disc.png"], ["name": "Fotografia", "icon":"Picture.png"]]
        var pos = 25
        
        var cW = 0
        var fS = 0
        var cI = 0
        var aux = 0
        var cC = 0

        
        if ( UIDevice.current.userInterfaceIdiom == .pad ) {
            cW = 130
            fS = Int(17)
            cI = Int(75)
            aux = 150
            cC = 40
        }
        if ( UIDevice.current.userInterfaceIdiom == .phone ) {
            cW = 70
            fS = 11
            cI = 40
            aux = 80
            cC = 20
        }

        
        for  x in 0...(inter.count-1) {
            let myView = UIView(frame: CGRect(x: pos, y: 0, width: cW, height: cW))
            let labelMusica = UILabel()
            
            labelMusica.font = UIFont(name: "Exo-Regular", size: CGFloat(fS))
            labelMusica.text = inter[x]["name"]!
            labelMusica.numberOfLines = 2
            labelMusica.textAlignment = NSTextAlignment.center
            labelMusica.lineBreakMode = NSLineBreakMode.byWordWrapping
            
            labelMusica.sizeToFit()
            labelMusica.translatesAutoresizingMaskIntoConstraints = false
            
            let int1 = UIImageView()

            int1.contentMode = .scaleToFill
            int1.image = UIImage(named:inter[x]["icon"]!)
            int1.translatesAutoresizingMaskIntoConstraints = false
            
            myView.addSubview(labelMusica)
            myView.addSubview(int1)
            
            let xConstraintLabel = NSLayoutConstraint(item: labelMusica, attribute: .centerX, relatedBy: .equal, toItem: myView, attribute: .centerX, multiplier: 1, constant: 0)
            let yConstraintLabel = NSLayoutConstraint(item: labelMusica, attribute: .centerY, relatedBy: .equal, toItem: myView, attribute: .centerY, multiplier: 1, constant: CGFloat(cC))
            let widthConstraintLabel = NSLayoutConstraint(item: labelMusica, attribute: NSLayoutAttribute.width, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(cW - 10))

            
            let xConstraint = NSLayoutConstraint(item: int1, attribute: .centerX, relatedBy: .equal, toItem: myView, attribute: .centerX, multiplier: 1, constant: 0)
            let yConstraint = NSLayoutConstraint(item: int1, attribute: .centerY, relatedBy: .equal, toItem: myView, attribute: .centerY, multiplier: 1, constant: -15)
            
            let widthConstraint = NSLayoutConstraint(item: int1, attribute: NSLayoutAttribute.width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(cI))
            let heightConstraint = NSLayoutConstraint(item: int1, attribute: NSLayoutAttribute.height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(cI))
            
            NSLayoutConstraint.activate([xConstraintLabel,yConstraintLabel, widthConstraintLabel,xConstraint, yConstraint, widthConstraint, heightConstraint])
            InterestScroll.addSubview(myView)
            pos = pos + aux

        }
        
 
        InterestScroll.contentSize = CGSize( width: (InterestScroll.frame.width/10) + 350, height: InterestScroll.frame.height/10)
        
        if ( UIDevice.current.userInterfaceIdiom == .pad ) {
            VTopInterest.constant = 40
            VInterestHeight.constant = 250
            SVInterestHeight.constant = 150
            VInterestTagWidth.constant = 170
            VInterestTagHeight.constant = 40
            BTwitterWidth.constant = 40
            BTwitterHeight.constant = 40
        }

        
        super.viewDidLoad()
    }
    
    func attributedString(from string: String, range: NSRange?) -> NSAttributedString {
        let myMutableString = NSMutableAttributedString(string: string)
        myMutableString.addAttribute(NSForegroundColorAttributeName,value: UIColor.black,range: range!)
        return myMutableString
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
