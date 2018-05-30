//
//  ViewController.swift
//  AudioVideoSwift
//
//  Created by Urvish Patel on 19/12/16.
//  Copyright © 2016 Urvish Patel. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var objPlayer:AVAudioPlayer?
    var moviePlayer : MPMoviePlayerViewController?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClick()-> Void
    {
        do {
            if let filePath:String = Bundle.main.path(forResource: "TestAudio", ofType: "mp3")
            {
                
                objPlayer = try AVAudioPlayer(contentsOf: NSURL.init(string: filePath)! as URL)
                guard let player = objPlayer
                    else
                {
                    return
                }
                player.prepareToPlay()
                 player.volume = 1.0
                
                //let timeInterval:TimeInterval = 60.0
                //player.play(atTime: objPlayer!.deviceCurrentTime)
                //player.playAtTime(timeInterval)
                //player.currentTime = timeInterval;
                player.play()
                
                
            }
        }
        catch let error as NSError
        {
            print(error.description)
        }
    }
   
    @IBAction func playVideo()  {
        
        let path = Bundle.main.path(forResource: "TestVideo", ofType:"mp4")
        let url = NSURL.fileURL(withPath: path!)
        
        let videoURL = url
        moviePlayer = MPMoviePlayerViewController(contentURL: videoURL )
        
        if let player = moviePlayer
        {
            player.view.frame = self.view.bounds
            //self.view.addSubview(player.view)
            
            self.present(moviePlayer!, animated: true, completion: nil)
            NotificationCenter.default.addObserver(self, selector:Selector(("didFinish")), name: NSNotification.Name.MPMoviePlayerPlaybackDidFinish, object: player)
        }
        else {
            NSLog("no player")
        }
    }
    func didFinish(notification:NSNotification) -> Void
    {
        
    }
}

