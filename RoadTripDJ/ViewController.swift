//
//  ViewController.swift
//  RoadTripDJ
//
//  Created by Graeme Mathieson on 23/08/2015.
//  Copyright © 2015 Wossname Industries. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    @IBOutlet weak var playerBar: UIToolbar!
    var playButton: UIBarButtonItem!

    var playlist = MPMediaItemCollection(items: [])
    let player = MPMusicPlayerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    private func togglePlayPause() {
        switch(player.playbackState) {
        case .Playing:
            print("Pausing")
            player.pause()
        default:
            print("Playing")
            player.play()
        }
        
        setPlayButtonForPlaybackState(player.playbackState)
    }

    private func playButtonItemForPlaybackState(state: MPMusicPlaybackState) -> UIBarButtonItem {
        let systemItem: UIBarButtonSystemItem
        switch(state) {
        case .Playing:
            systemItem = .Pause
        default:
            systemItem = .Play
        }
        
        return UIBarButtonItem(barButtonSystemItem: systemItem, target: self, action: Selector("playPause:"))
    }

    private func setPlayButtonForPlaybackState(state: MPMusicPlaybackState) {
        playerBar.items = playerBar.items?.map { (barButtonItem: UIBarButtonItem) -> UIBarButtonItem in
            if(barButtonItem == playButton) {
                playButton = playButtonItemForPlaybackState(state)
                return playButton
            } else {
                return barButtonItem
            }
        }
    }

    // MARK: Actions

    @IBAction func addMusic(sender: UIBarButtonItem) {
        let mediaPicker = MPMediaPickerController(mediaTypes: .Music)
        mediaPicker.delegate = self
        mediaPicker.prompt = "Add music to your playlist"
        mediaPicker.showsCloudItems = true
        mediaPicker.allowsPickingMultipleItems = true

        presentViewController(mediaPicker, animated: true, completion: nil)
    }

    @IBAction func playPause(sender: UIBarButtonItem) {
        playButton = sender // FIXME: Somewhat subtopimal.
        togglePlayPause()
    }

}

// MARK: MPMediaPickerControllerDelegate
extension ViewController : MPMediaPickerControllerDelegate {
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        print("mediaPicker:\(mediaPicker) didPickMediaItems:\(mediaItemCollection)")
        
        let items = playlist.items + mediaItemCollection.items
        playlist = MPMediaItemCollection(items: items)
        
        var index = 0
        for item in playlist.items {
            index += 1
            print("\(index): \(item.artist) - \(item.title)")
        }
        
        player.setQueueWithItemCollection(playlist)
        
        switch(player.playbackState) {
        case .Playing:
            break
        default:
            player.play()
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("mediaPickerDidCancel:\(mediaPicker)")
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
