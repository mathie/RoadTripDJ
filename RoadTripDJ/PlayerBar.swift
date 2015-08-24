//
//  PlayerBar.swift
//  RoadTripDJ
//
//  Created by Graeme Mathieson on 24/08/2015.
//  Copyright © 2015 Wossname Industries. All rights reserved.
//

import UIKit

@IBDesignable class PlayerBar: UIToolbar {
    @IBInspectable let spacing: CGFloat = 44.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializePlayerBar()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializePlayerBar()
    }

    private func initializePlayerBar() {
        setupToolbar()
    }

    private func setupToolbar() {
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)

        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        fixedSpace.width = spacing

        let prevButton = buildSkipBackButton()
        let playButton = buildPlayButton()
        let nextButton = buildSkipForwardButton()
        
        items = [
            flexibleSpace,
            prevButton,
            fixedSpace,
            playButton,
            fixedSpace,
            nextButton,
            flexibleSpace
        ]
    }
    
    private func buildSkipBackButton() -> UIBarButtonItem {
        let image = UIImage(named: "1247-skip-back-toolbar")!
        let selectedImage = UIImage(named: "1247-skip-back-toolbar-selected")!
        
        return buildButtonWithImage(image, selectedImage: selectedImage, target: nil, action: nil)
    }
    
    private func buildPlayButton() -> UIBarButtonItem {
        let image = UIImage(named: "1241-play-toolbar")!
        let selectedImage = UIImage(named: "1241-play-toolbar-selected")!
        
        return buildButtonWithImage(image, selectedImage: selectedImage, target: nil, action: nil)
    }
    
    private func buildSkipForwardButton() -> UIBarButtonItem {
        let image = UIImage(named: "1248-skip-ahead-toolbar")!
        let selectedImage = UIImage(named: "1248-skip-ahead-toolbar-selected")!
        
        return buildButtonWithImage(image, selectedImage: selectedImage, target: nil, action: nil)
    }
    
    private func buildButtonWithImage(image: UIImage, selectedImage: UIImage, target: AnyObject?, action: Selector?) -> UIBarButtonItem {
        let button = UIButton(type: .Custom)
        button.setImage(image.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        button.setImage(selectedImage.imageWithRenderingMode(.AlwaysTemplate), forState: .Highlighted)
        button.frame = CGRect(x: 0, y: 0, width: image.size.width * 2, height: image.size.height * 2)
        
        return UIBarButtonItem(customView: button)
    }
}
