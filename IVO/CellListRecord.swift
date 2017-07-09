//
//  CellListRecord.swift
//  IVO
//
//  Created by user on 5/28/17.
//  Copyright © 2017 3dlink. All rights reserved.
//

import UIKit
import AVFoundation

class CellListRecord: UITableViewCell, AVAudioPlayerDelegate {

    @IBOutlet weak var nameRec: UILabel!
    @IBOutlet weak var progressRecord: UIProgressView!
    @IBOutlet weak var playRecord: UIButton!
    @IBOutlet weak var stopPlay: UIButton!
    @IBOutlet weak var deleted: UIButton!
    @IBOutlet weak var timerRecord: UILabel!
    
    var audioPlayer : AVAudioPlayer?

    
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.progressRecord.setProgress(0.0, animated: true)
        stopPlay.isHidden = true
        playRecord.isHidden = false

    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?){
//        print(error.debugDescription)
    }
    
    internal func audioPlayerBeginInterruption(_ player: AVAudioPlayer){
//        print(player.debugDescription)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stopPlay.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // print(selected)
        // Configure the view for the selected state
    }

    @IBAction func playRecord(_ sender: UIButton) {
            let fileManager = FileManager.default
            let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
            let documentDirectory = urls[0] as NSURL
            let nameSound = "Record \(sender.tag + 1).m4a"
            let soundURL = documentDirectory.appendingPathComponent(nameSound)
            
            self.audioPlayer = try! AVAudioPlayer(contentsOf: soundURL! as URL)
            self.audioPlayer?.prepareToPlay()
            self.audioPlayer?.delegate = self
            self.audioPlayer?.play()
            var newTime = 0.0
        
            var time = timerRecord.text?.components(separatedBy: ":")
            if let seconds = Double((time?[1])!){
                if let minutes = Double((time?[0])!){
                    newTime = seconds + (minutes * 60.0)
                }
            }
        
            UIView.animate(withDuration: newTime, animations: { () -> Void in
                self.progressRecord.setProgress(1.0, animated: true)
            })
            sender.isHidden = true
            stopPlay.isHidden = false
    }

    
    @IBAction func stopPlay(_ sender: UIButton) {
        self.audioPlayer?.stop()
        sender.isHidden = true
        playRecord.isHidden = false
        self.progressRecord.setProgress(0.0, animated: true)
    }
    

}
