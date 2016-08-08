//
//  ViewController.swift
//  UnlockIPhone
//
//  Created by saitjr on 8/7/16.
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
        
        let containerView = UIView()
        containerView.bounds = CGRect(x: 0, y: 0, width: 300, height: 80)
        containerView.center = view.center
        view.addSubview(containerView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        gradientLayer.colors = [UIColor.blackColor().CGColor, UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor]
        gradientLayer.locations = [0.25, 0.5, 0.75]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        containerView.layer.addSublayer(gradientLayer)
        
        let text: NSString = "Saitjr"
        let style = NSMutableParagraphStyle()
        style.alignment = .Center
        let textAttribute: [String: AnyObject] = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 30)!, NSParagraphStyleAttributeName: style]
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0)
        text.drawInRect(containerView.bounds, withAttributes: textAttribute)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textLayer = CALayer()
        textLayer.frame = view.bounds.offsetBy(dx: 0, dy: 20)
        textLayer.contents = image.CGImage
        gradientLayer.mask = textLayer
        
        gradientLayer.addAnimation(animation(), forKey: "LocationAnimation")
    }
    
    private func animation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.0, 0.25]
        animation.toValue = [0.75, 1.0, 1.0]
        animation.duration = 3.0
        animation.repeatCount = Float.infinity
        return animation
    }
}