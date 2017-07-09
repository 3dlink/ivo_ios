//
//  CastingStep2Controller.swift
//  IVO
//
//  Created by user on 5/18/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import Foundation
import UIKit
import Photos
import AVKit
import MobileCoreServices
import AVFoundation

class CastingStep2Controller :  UIViewController, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate, AVAudioRecorderDelegate, AVAudioPlayerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var viewRecordAudio: UIView!
    @IBOutlet weak var Tab: UISegmentedControl!
    @IBOutlet weak var listRecord: UITableView!
    
    @IBOutlet weak var viewSelectGallery: UIView!
    @IBOutlet weak var Stop: UIButton!
    @IBOutlet weak var Rec: UIButton!
    @IBOutlet weak var nextStep: UIButton!
    @IBOutlet weak var timerStatus: UILabel!
    
    
    var recordingSession : AVAudioSession!
    var audioRecorder    :AVAudioRecorder!
    var settings         = [String : Int]()
    var audioPlayer : AVAudioPlayer!
//    var objRec : [String : String, String : URL] = []
    var objRec: [[String : Any]] = []

//    var objRec2 = [[String : String, String: NSURL]]()

    
    var meterTimer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Stop.isHidden = true
        viewRecordAudio.isHidden = true
        viewSelectGallery.isHidden = false
        
        
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        print("Allow")
                    } else {
                        print("Dont Allow")
                    }
                }
            }
        } catch {
            print("failed to record!")
        }
        
        // Audio Settings
        
        settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
    }
    
    func directoryURL() -> NSURL? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = urls[0] as NSURL
        let soundURL = documentDirectory.appendingPathComponent("Record \(objRec.count+1).m4a")
        print(soundURL)
        return soundURL as NSURL?
    }
    
    
    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            audioRecorder = try AVAudioRecorder(url: self.directoryURL()! as URL,
                                                settings: settings)
            audioRecorder.delegate = self
            audioRecorder.prepareToRecord()
        } catch {
            finishRecording(success: false)
        }
        do {
            try audioSession.setActive(true)
            audioRecorder.record()
        } catch {
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        
        objRec.append(["name":"Record \(objRec.count+1)", "time":timerStatus.text!,"url": audioRecorder.url])
        timerStatus.text = "00:00"
        listRecord.reloadData()
        if success {
            print(success)
        } else {
            audioRecorder = nil
            print("Somthing Wrong.")
        }
    }
    
    
    @IBAction func startRecording(_ sender: AnyObject) {
        Stop.isHidden = false
        Rec.isHidden = true
        Tab.isEnabled = false
        nextStep.isEnabled = false
        
        meterTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(CastingStep2Controller.updateAudioMeter), userInfo: nil, repeats: true)
        self.startRecording()
        
    }
    
    func updateAudioMeter(timer:Timer) {
        
        let min = Int(audioRecorder.currentTime / 60)
        
        let sec = Int( (audioRecorder.currentTime).truncatingRemainder(dividingBy: 60) )
        let s = String(format: "%02d:%02d", min, sec)
        timerStatus.text = s
        
    }
    
    @IBAction func stopRecord(_ sender: AnyObject) {
        Stop.isHidden = true
        Rec.isHidden = false
        Tab.isEnabled = true
        nextStep.isEnabled = true
        
        meterTimer.invalidate()
        self.finishRecording(success: true)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print(flag)
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?){
        print(error.debugDescription)
    }
    
    internal func audioPlayerBeginInterruption(_ player: AVAudioPlayer){
        print(player.debugDescription)
    }
    @IBAction func openGallery(_ sender: AnyObject) {
        let picker : UIImagePickerController = UIImagePickerController()
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.delegate = self
        picker.allowsEditing = false
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func changeTab(_ sender: UISegmentedControl) {
        switch Tab.selectedSegmentIndex
        {
        case 0:
            viewRecordAudio.isHidden = true
            viewSelectGallery.isHidden = false
        case 1:
            viewRecordAudio.isHidden = true
            viewSelectGallery.isHidden = true

            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
                //load the camera interface
                let picker : UIImagePickerController = UIImagePickerController()
                picker.sourceType = UIImagePickerControllerSourceType.camera
                picker.delegate = self
                picker.allowsEditing = true
                self.present(picker, animated: true, completion: nil)
            }else{
                //no camera available
                let alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(alertAction)in
                    alert.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        case 2:
            viewRecordAudio.isHidden = true
            viewSelectGallery.isHidden = true
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
                //load the camera interface
                let picker : UIImagePickerController = UIImagePickerController()
                picker.sourceType = UIImagePickerControllerSourceType.camera
                picker.mediaTypes = [kUTTypeMovie as String]
                picker.delegate = self
                picker.allowsEditing = false
                self.present(picker, animated: true, completion: nil)
            }else{
                //no camera available
                let alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {(alertAction)in
                    alert.dismiss(animated: true, completion: nil)
                }))
                self.present(alert, animated: true, completion: nil)
            }
        case 3:
            viewRecordAudio.isHidden = false
            viewSelectGallery.isHidden = true
        default:
            break;
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objRec.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ntf = self.listRecord.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! CellListRecord
        
        ntf.timerRecord.text = self.objRec[indexPath.item]["time"] as! String?
        ntf.nameRec.text = self.objRec[indexPath.item]["name"] as! String?
        ntf.playRecord.tag = indexPath.item
        ntf.stopPlay.tag = indexPath.item
        return ntf
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    
        self.audioPlayer = try! AVAudioPlayer(contentsOf: objRec[indexPath.item]["url"] as! URL)
        self.audioPlayer.prepareToPlay()
        self.audioPlayer.delegate = self
        self.audioPlayer.play()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            objRec.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
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

