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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addMusic(sender: UIBarButtonItem) {
        let mediaPicker = MPMediaPickerController(mediaTypes: .Music)
        presentViewController(mediaPicker, animated: true, completion: nil)
    }
}

