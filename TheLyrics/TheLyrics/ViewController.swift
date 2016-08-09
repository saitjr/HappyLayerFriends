//
//  ViewController.swift
//  TheLyrics
//
//  Created by saitjr on 8/8/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }
}

extension ViewController {
    private func setupUI() {
        view.backgroundColor = .blackColor()
        
        let orangeView = UIView()
        orangeView.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        orangeView.center = CGPoint(x: orangeView.center.x, y: view.center.y)
        orangeView.backgroundColor = .orangeColor()
        view.addSubview(orangeView)
        
        let imageView = UIImageView(image: UIImage(named: "Text.png"))
        imageView.bounds = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 80)
        imageView.center = view.center
        imageView.contentMode = .ScaleAspectFit
        view.addSubview(imageView)
        
        UIView.animateWithDuration(3, delay: 0, options: [.Repeat, .Autoreverse],
            animations: {
                orangeView.frame.origin.x = self.view.bounds.size.width - orangeView.bounds.size.width
            }, completion: nil)
    }
}