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

    var playlist: MPMediaItemCollection = MPMediaItemCollection(items: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addMusic(sender: UIBarButtonItem) {
        let mediaPicker = MPMediaPickerController(mediaTypes: .Music)
        mediaPicker.delegate = self
        mediaPicker.prompt = "Add music to your playlist"
        mediaPicker.showsCloudItems = true
        mediaPicker.allowsPickingMultipleItems = true

        presentViewController(mediaPicker, animated: true, completion: nil)
    }

}

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

        dismissViewControllerAnimated(true, completion: nil)
    }

    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("mediaPickerDidCancel:\(mediaPicker)")
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

