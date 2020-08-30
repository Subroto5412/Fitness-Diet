//
//  FADMusicController.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 19/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer


class FADMusicController: UIViewController, UITableViewDataSource, UITableViewDelegate,AVAudioPlayerDelegate  {

    var currentAudio = ""
    var currentAudioPath:URL!
    var audioList:NSArray!
    var currentAudioIndex: Int = 0
    var audioPlayer:AVAudioPlayer! = nil
    var songName: String = ""
    var timer:Timer!
    var totalAudioLength = ""
    var audioLength = 0.0
    
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var backButton: UIView!
    @IBOutlet weak var bodyContainerView: UIView!
    @IBOutlet var playButton : UIButton!
    @IBOutlet var playerProgressSlider : UISlider!
    @IBOutlet weak var detailScreenSongName: UILabel!
    @IBOutlet var progressTimerLabel : UILabel!
    @IBOutlet var totalLengthOfAudioLabel : UILabel!
    @IBOutlet weak var detailScreenPlayerProgressSlider: UISlider!
    @IBOutlet weak var detailScreenPlayButton: UIButton!
    
    @IBOutlet weak var albumPhoto: UIImageView!
    @IBOutlet weak var detailSongNameLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var detailScreenView: UIView!
    var items = FADDietPlanDataManager.shared.getAllDietPlan()
    
    class func initWithStoryboard() -> FADMusicController
         {
             let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let controller = storyboard.instantiateViewController(withIdentifier: FADMusicController.className) as! FADMusicController
             return controller
         }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleName.text = "List Your Favourite\n Workout Playlist!"
        self.backButton.layer.cornerRadius = 10
        self.bodyContainerView.layer.cornerRadius = 20
        
        readFromPlist()
        prepareAudio()
        updateLabels()

    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return audioList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var songNameDict = NSDictionary();
        songNameDict = audioList.object(at: (indexPath as NSIndexPath).row) as! NSDictionary
        let songName = songNameDict.value(forKey: "songName") as! String
        
        var albumNameDict = NSDictionary();
        albumNameDict = audioList.object(at: (indexPath as NSIndexPath).row) as! NSDictionary
        let albumName = albumNameDict.value(forKey: "albumName") as! String
        
        var infoDict = NSDictionary();
        infoDict = audioList.object(at: (indexPath as NSIndexPath).row) as! NSDictionary
        let artworkName = infoDict.value(forKey: "albumArtwork") as! String
               
        
        
        let cell:FADMusicCell = tableView.dequeueReusableCell(withIdentifier: "FADMusicCell") as! FADMusicCell
        cell.titleLbl.text =  songName
        cell.subTitle.text =  albumName
        cell.photo.image =  UIImage(named: artworkName)
        
        return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        
        var songNameDict = NSDictionary();
        songNameDict = audioList.object(at: (indexPath as NSIndexPath).row) as! NSDictionary
        let songName = songNameDict.value(forKey: "songName") as! String
         
        var albumNameDict = NSDictionary();
        albumNameDict = audioList.object(at: (indexPath as NSIndexPath).row) as! NSDictionary
        let albumName = albumNameDict.value(forKey: "albumName") as! String
        
        
        self.currentAudioIndex = indexPath.row
        self.detailSongNameLabel.text = songName+"\("\n")"+albumName
        self.songNameLabel.text = songName
        
        let play = UIImage(named: "playing1")
        let pause = UIImage(named: "playing2")
        
        let bigScreenPlay = UIImage(named: "Play_iconpng")
        let bigScreenPause = UIImage(named: "PlayButton")
        
        if self.audioPlayer.isPlaying{
                   self.pauseAudioPlayer()
             } else {
             self.prepareAudio()
             self.playAudio()
               }
        self.playButton.setImage(audioPlayer.isPlaying ? pause : play, for: UIControl.State())
        self.detailScreenPlayButton.setImage(audioPlayer.isPlaying ? bigScreenPause : bigScreenPlay, for: UIControl.State())
        
    }

    @IBAction func backBtn(_ sender: UIButton) {
        let controller = FADHomeViewController.initWithStoryboard()
        self.present(controller, animated: true, completion: nil);
    }
    
    @IBAction func playBtn(_ sender: UIButton) {
        
        let play = UIImage(named: "playing1")
        let pause = UIImage(named: "playing2")
        
        let bigScreenPlay = UIImage(named: "Play_iconpng")
        let bigScreenPause = UIImage(named: "PlayButton")
        
        if self.audioPlayer.isPlaying{
            self.pauseAudioPlayer()
        }else{
            self.playAudio()
        }
        self.playButton.setImage(audioPlayer.isPlaying ? pause : play, for: UIControl.State())
        self.detailScreenPlayButton.setImage(audioPlayer.isPlaying ? bigScreenPause : bigScreenPlay, for: UIControl.State())
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        self.playNextAudio()
    }
    
    
    @IBAction func previousBtn(_ sender: UIButton) {
        self.playPreviousAudio()
    }
    
    @IBAction func changeSlider(_ sender: UISlider) {
        self.audioPlayer.currentTime = TimeInterval(sender.value)
        if audioPlayer.isPlaying{
            
        } else {
            self.audioPlayer.play()
        }
       
    }
    @IBAction func detailsBtn(_ sender: UIButton) {
        
        self.detailScreenView.isHidden = false
    }
    
    @IBAction func minBtn(_ sender: UIButton) {
        
        self.detailScreenView.isHidden = true
    }
    @IBAction func detailScreenPlayBtn(_ sender: UIButton) {
        
        let play = UIImage(named: "playing1")
        let pause = UIImage(named: "playing2")
        
        let bigScreenPlay = UIImage(named: "Play_iconpng")
        let bigScreenPause = UIImage(named: "PlayButton")
        if self.audioPlayer.isPlaying{
            self.pauseAudioPlayer()
        }else{
            self.playAudio()
        }
        self.playButton.setImage(audioPlayer.isPlaying ? pause : play, for: UIControl.State())
        self.detailScreenPlayButton.setImage(audioPlayer.isPlaying ? bigScreenPause : bigScreenPlay, for: UIControl.State())
    }
    
    @IBAction func detailScreenSlider(_ sender: UISlider) {
        self.audioPlayer.currentTime = TimeInterval(sender.value)
        if self.audioPlayer.isPlaying{
            
        } else {
            self.audioPlayer.play()
        }
    }
    @IBAction func detailScreenNextBtn(_ sender: UIButton) {
        self.playNextAudio()
    }
    @IBAction func detailScreenPreviousBtn(_ sender: UIButton) {
        self.playPreviousAudio()
    }


    //Read plist file and creates an array of dictionary
    func readFromPlist(){
        let path = Bundle.main.path(forResource: "audio_list", ofType: "plist")
        audioList = NSArray(contentsOfFile:path!)
       
    }
    
    func readArtistNameFromPlist(_ indexNumber: Int) -> String {
        readFromPlist()
        var infoDict = NSDictionary();
        infoDict = audioList.object(at: indexNumber) as! NSDictionary
        let artistName = infoDict.value(forKey: "artistName") as! String
        return artistName
    }
    
    func readAlbumNameFromPlist(_ indexNumber: Int) -> String {
        readFromPlist()
        var infoDict = NSDictionary();
        infoDict = audioList.object(at: indexNumber) as! NSDictionary
        let albumName = infoDict.value(forKey: "albumName") as! String
        return albumName
    }

    
    func readSongNameFromPlist(_ indexNumber: Int) -> String {
        readFromPlist()
        var songNameDict = NSDictionary();
        songNameDict = audioList.object(at: indexNumber) as! NSDictionary
        let songName = songNameDict.value(forKey: "songName") as! String
        return songName
    }
    
    func readArtworkNameFromPlist(_ indexNumber: Int) -> String {
        readFromPlist()
        var infoDict = NSDictionary();
        infoDict = audioList.object(at: indexNumber) as! NSDictionary
        let artworkName = infoDict.value(forKey: "albumArtwork") as! String
        return artworkName
    }

    
    func updateLabels(){
        updateArtistNameLabel()
        updateAlbumNameLabel()
        updateSongNameLabel()
        updateAlbumArtwork()

        
    }
    
    
    func updateArtistNameLabel(){
        let artistName = readArtistNameFromPlist(currentAudioIndex)
       // artistNameLabel.text = artistName
    }
    func updateAlbumNameLabel(){
        let albumName = readAlbumNameFromPlist(currentAudioIndex)
       // albumNameLabel.text = albumName
    }
    
    func updateSongNameLabel(){
        let songName = readSongNameFromPlist(currentAudioIndex)
        detailSongNameLabel.text = songName
        songNameLabel.text = songName
    }
    
    func updateAlbumArtwork(){
        let artworkName = readArtworkNameFromPlist(currentAudioIndex)
        albumPhoto.image = UIImage(named: artworkName)
    }
    
    //Sets audio file URL
    func setCurrentAudioPath(){
        currentAudio = readSongNameFromPlist(currentAudioIndex)
        currentAudioPath = URL(fileURLWithPath: Bundle.main.path(forResource: currentAudio, ofType: "mp3")!)
    }
    
        // Prepare audio for playing
        func prepareAudio(){
            setCurrentAudioPath()
//            do {
//                //keep alive audio at background
//                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.playback)))
//            } catch _ {
//            }
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch _ {
            }
            UIApplication.shared.beginReceivingRemoteControlEvents()
            audioPlayer = try? AVAudioPlayer(contentsOf: currentAudioPath)
            audioPlayer.delegate = self
    //        audioPlayer
            audioLength = audioPlayer.duration
            playerProgressSlider.maximumValue = CFloat(audioPlayer.duration)
            playerProgressSlider.minimumValue = 0.0
            playerProgressSlider.value = 0.0
            audioPlayer.prepareToPlay()
            detailScreenPlayerProgressSlider.maximumValue = CFloat(audioPlayer.duration)
            detailScreenPlayerProgressSlider.minimumValue = 0.0
            detailScreenPlayerProgressSlider.value = 0.0
            showTotalSongLength()
            updateLabels()
            progressTimerLabel.text = "00:00"
            
            
        }
    
    //MARK:- Player Controls Methods
    func  playAudio(){
        audioPlayer.play()
        startTimer()
        updateLabels()
//        saveCurrentTrackNumber()
//        showMediaInfo()
    }
    
    func pauseAudioPlayer(){
        audioPlayer.pause()
        
    }
    
    func playNextAudio(){
        currentAudioIndex += 1
        if currentAudioIndex>audioList.count-1{
            currentAudioIndex -= 1
            
            return
        }
        if audioPlayer.isPlaying{
            prepareAudio()
            playAudio()
        }else{
            prepareAudio()
        }
        
    }
    
    
    func playPreviousAudio(){
        currentAudioIndex -= 1
        if currentAudioIndex<0{
            currentAudioIndex += 1
            return
        }
        if audioPlayer.isPlaying{
            prepareAudio()
            playAudio()
        }else{
            prepareAudio()
        }
        
    }
    
    func startTimer(){
           if timer == nil {
               timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(FADMusicController.update(_:)), userInfo: nil,repeats: true)
               timer.fire()
           }
       }
           
       func stopTimer(){
           timer.invalidate()
                  
       }
              
       @objc func update(_ timer: Timer){
           if !audioPlayer.isPlaying{
               return
           }
           let time = calculateTimeFromNSTimeInterval(audioPlayer.currentTime)
           progressTimerLabel.text  = "\(time.minute):\(time.second)"
           playerProgressSlider.value = CFloat(audioPlayer.currentTime)
           detailScreenPlayerProgressSlider.value = CFloat(audioPlayer.currentTime)
       }
    //song length returns
       func calculateTimeFromNSTimeInterval(_ duration:TimeInterval) ->(minute:String, second:String){
       
           let minute_ = abs(Int((duration/60).truncatingRemainder(dividingBy: 60)))
           let second_ = abs(Int(duration.truncatingRemainder(dividingBy: 60)))
           
           let minute = minute_ > 9 ? "\(minute_)" : "0\(minute_)"
           let second = second_ > 9 ? "\(second_)" : "0\(second_)"
           return (minute,second)
       }
    
    func showTotalSongLength(){
           calculateSongLength()
           totalLengthOfAudioLabel.text = totalAudioLength
       }

    func calculateSongLength(){
        let time = calculateTimeFromNSTimeInterval(audioLength)
        totalAudioLength = "\(time.minute):\(time.second)"
    }

}

