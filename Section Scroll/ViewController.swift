//
//  ViewController.swift
//  Section Scroll
//
//  Created by Chris Li on 4/11/19.
//  Copyright © 2019 Chris Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var firstToTop: NSLayoutConstraint!
    @IBOutlet weak var secondToTop: NSLayoutConstraint!
    @IBOutlet weak var thirdToTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        secondToTop.constant = 100
        secondView.backgroundColor = UIColor.blue
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOpacity = 1
        secondView.layer.shadowOffset = CGSize.zero
        secondView.layer.shadowRadius = 3
        
        thirdToTop.constant = 200
        thirdView.backgroundColor = UIColor.purple
        thirdView.layer.shadowColor = UIColor.black.cgColor
        thirdView.layer.shadowOpacity = 1
        thirdView.layer.shadowOffset = CGSize.zero
        thirdView.layer.shadowRadius = 3
        
    }

    @IBAction func firstButtonPressed(_ sender: Any) {
        secondToTop.constant = view.frame.height - 150
        thirdToTop.constant = view.frame.height - 100
    }
    
    @IBAction func secondButtonPressed(_ sender: Any) {
        secondToTop.constant = 50
        thirdToTop.constant = view.frame.height - 100
    }
    
    @IBAction func thirdButtonPressed(_ sender: Any) {
        secondToTop.constant = 50
        thirdToTop.constant = 100
    }
}

