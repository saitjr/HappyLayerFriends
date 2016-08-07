//
//  ViewController.swift
//  FadeMessage
//
//  Created by saitjr on 8/7/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let identifier = "MessageCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
    }
}

extension ViewController {
    private func setupUI() {
        let imageView = UIImageView(image: UIImage(named: "emma-watson.jpg"))
        imageView.frame = view.bounds
        imageView.contentMode = .ScaleAspectFill
        view.addSubview(imageView)
        
        let maskView = UIView()
        maskView.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: view.frame.size.height - 200)
        view.addSubview(maskView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.blackColor().colorWithAlphaComponent(0.2).CGColor, UIColor.blackColor().CGColor]
        gradientLayer.frame = maskView.bounds;
        gradientLayer.locations = [0, 0.2, 1]
        maskView.layer.mask = gradientLayer
        
        let tableView = UITableView()
        tableView.frame = maskView.bounds
        tableView.rowHeight = 50
        tableView.backgroundColor = .clearColor()
        tableView.separatorStyle = .None
        tableView.showsVerticalScrollIndicator = false
        tableView.registerClass(MessageCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self
        maskView.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier) ?? MessageCell()
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
}