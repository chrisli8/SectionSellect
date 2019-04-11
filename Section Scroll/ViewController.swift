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
    @IBOutlet weak var secondSectionBtnView: UIView!
    
    // constaints for sections
    @IBOutlet weak var firstToTop: NSLayoutConstraint!
    @IBOutlet weak var secondToTop: NSLayoutConstraint!
    @IBOutlet weak var thirdToTop: NSLayoutConstraint!
    
    // constaints for first button
    @IBOutlet weak var fBtnTop: NSLayoutConstraint!
    @IBOutlet weak var fBtnLead: NSLayoutConstraint!
    @IBOutlet weak var fBtnTrail: NSLayoutConstraint!
    
    // constaints for second button
    @IBOutlet weak var sBtnTop: NSLayoutConstraint!
    @IBOutlet weak var sBtnLead: NSLayoutConstraint!
    @IBOutlet weak var sBtnTrail: NSLayoutConstraint!
    
    // constraints for third button
    @IBOutlet weak var tBtnTop: NSLayoutConstraint!
    @IBOutlet weak var tBtnLead: NSLayoutConstraint!
    @IBOutlet weak var tBtnTrail: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.secondToTop.constant = self.view.frame.height - (150 + 48)
        self.thirdToTop.constant = self.view.frame.height - (100 + 32)
        secondSectionBtnView.layer.borderColor = UIColor.black.cgColor
        secondSectionBtnView.layer.borderWidth = 2
        secondSectionBtnView.backgroundColor = UIColor.clear
        setBtnColorsDark()
    }
    
    // Color to use (from app)
//    UIColor(red: 255.0/255.0, green: 205.0/255.0, blue: 200.0/255.0, alpha: 1.0),
//    UIColor(red: 252.0/255.0, green: 205.0/255.0, blue: 174.0/255.0, alpha: 1.0),
//    UIColor(red: 252.0/255.0, green: 237.0/255.0, blue: 186.0/255.0, alpha: 1.0),
//    UIColor(red: 203.0/255.0, green: 255.0/255.0, blue: 224.0/255.0, alpha: 1.0),
//    UIColor(red: 186.0/255.0, green: 236.0/255.0, blue: 242.0/255.0, alpha: 1.0),
//    UIColor(red: 208.0/255.0, green: 217.0/255.0, blue: 246.0/255.0, alpha: 1.0),//198, 205, 229
//    UIColor(red: 238.0/255.0, green: 223.0/255.0, blue: 251.0/255.0, alpha: 1.0),
//    UIColor(red: 244.0/255.0, green: 197.0/255.0, blue: 212.0/255.0, alpha: 1.0)
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        firstView.backgroundColor = UIColor(red: 255.0/255.0, green: 205.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        
        //secondToTop.constant = 100
        secondView.backgroundColor = UIColor(red: 252.0/255.0, green: 205.0/255.0, blue: 174.0/255.0, alpha: 1.0)
//        secondView.layer.shadowColor = UIColor.black.cgColor
//        secondView.layer.shadowOpacity = 1
//        secondView.layer.shadowOffset = CGSize.zero
//        secondView.layer.shadowRadius = 3
        
        //thirdToTop.constant = 200
        thirdView.backgroundColor = UIColor(red: 252.0/255.0, green: 237.0/255.0, blue: 186.0/255.0, alpha: 1.0)
//        thirdView.layer.shadowColor = UIColor.black.cgColor
//        thirdView.layer.shadowOpacity = 1
//        thirdView.layer.shadowOffset = CGSize.zero
//        thirdView.layer.shadowRadius = 3
        
        roundButtonCorners(button: firstButton)
        roundButtonCorners(button: secondButton)
        roundButtonCorners(button: thirdButton)
        
        
    }

    @IBAction func firstButtonPressed(_ sender: Any) {
        self.secondToTop.constant = self.view.frame.height - (150 + 48)
        self.thirdToTop.constant = self.view.frame.height - (100 + 32)
        
        zeroFirstBtnConstraints()
        setSecondBtnConstrains(to: 8.0)
        setThirdBtnConstrains(to: 8.0)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            
            self.firstButton.layer.cornerRadius = 0
            self.roundButtonCorners(button: self.secondButton)
            self.roundButtonCorners(button: self.thirdButton)

        }, completion: { (value: Bool) in
            
        })
        
        
        //secondToTop.constant = view.frame.height - 150
        //thirdToTop.constant = view.frame.height - 100
    }
    
    @IBAction func secondButtonPressed(_ sender: Any) {
        secondToTop.constant = (50 + 16)
        thirdToTop.constant = view.frame.height - (100 + 32)
        
        setFirstBtnConstrains(to: 8.0)
        zeroSecondBtnConstrains()
        setThirdBtnConstrains(to: 8.0)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            
            self.roundButtonCorners(button: self.firstButton)
            self.secondButton.layer.cornerRadius = 0
            self.roundButtonCorners(button: self.thirdButton)
        }, completion: { (value: Bool) in
            
        })
    }
    
    @IBAction func thirdButtonPressed(_ sender: Any) {
        secondToTop.constant = (50 + 16)
        thirdToTop.constant = (100 + 32)
        
        setFirstBtnConstrains(to: 8.0)
        setSecondBtnConstrains(to: 8.0)
        zeroThirdBtnConstrains()

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: { () -> Void in
            
            self.view.layoutIfNeeded()
            
            self.roundButtonCorners(button: self.firstButton)
            self.roundButtonCorners(button: self.secondButton)
            self.thirdButton.layer.cornerRadius = 0
        }, completion: { (value: Bool) in
            
        })
    }
    
    // MARK: - Helper Methods
    
    func roundButtonCorners(button : UIButton) {
        let height = button.frame.height
        button.layer.cornerRadius = height / 2
    }
    
    func zeroFirstBtnConstraints() {
        zeroBtnConstaints(top: fBtnTop, lead: fBtnLead, trail: fBtnTrail)
    }
    
    func zeroSecondBtnConstrains() {
        zeroBtnConstaints(top: sBtnTop, lead: sBtnLead, trail: sBtnTrail)
    }
    
    func zeroThirdBtnConstrains() {
        zeroBtnConstaints(top: tBtnTop, lead: tBtnLead, trail: tBtnTrail)
    }
    
    func setFirstBtnConstrains(to: CGFloat) {
        setBtnConstrains(top: fBtnTop, lead: fBtnLead, trail: fBtnTrail, to: to)
    }
    
    func setSecondBtnConstrains(to: CGFloat) {
        setBtnConstrains(top: sBtnTop, lead: sBtnLead, trail: sBtnTrail, to: to)
    }
    
    func setThirdBtnConstrains(to: CGFloat) {
        setBtnConstrains(top: tBtnTop, lead: tBtnLead, trail: tBtnTrail, to: to)
    }
    
    func setBtnConstrains(top: NSLayoutConstraint, lead: NSLayoutConstraint,
                          trail: NSLayoutConstraint, to: CGFloat) {
        top.constant = to
        lead.constant = to
        trail.constant = to
    }
    
    func zeroBtnConstaints(top: NSLayoutConstraint, lead: NSLayoutConstraint,
                           trail: NSLayoutConstraint) {
        setBtnConstrains(top: top, lead: lead, trail: trail, to: 0)
    }
    
//    UIColor(red: 210.0/255.0, green: 64.0/255.0, blue: 48.0/255.0, alpha: 1.0),
//    UIColor(red: 223.0/255.0, green: 111.0/255.0, blue: 37.0/255.0, alpha: 1.0),
//    UIColor(red: 248.0/255.0, green: 192.0/255.0, blue: 0.0/255.0, alpha: 1.0), //248, 192, 0 old yellow
//    UIColor(red: 0.0/255.0, green: 186.0/255.0, blue: 76.0/255.0, alpha: 1.0),
//    UIColor(red: 0.0/255.0, green: 201.0/255.0, blue: 227.0/255.0, alpha: 1.0),
//    UIColor(red: 22.0/255.0, green: 53.0/255.0, blue: 166.0/255.0, alpha: 1.0), //32, 71, 215 old blue
//    UIColor(red: 142.0/255.0, green: 41.0/255.0, blue: 229.0/255.0, alpha: 1.0),
//    UIColor(red: 220.0/255.0, green: 44.0/255.0, blue: 98.0/255.0, alpha: 1.0)
    func setBtnColorsDark() {
        firstButton.backgroundColor = UIColor(red: 210.0/255.0, green: 64.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        firstButton.tintColor = UIColor.white
        
        secondButton.backgroundColor = UIColor(red: 223.0/255.0, green: 111.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        secondButton.tintColor = UIColor.white
        
        thirdButton.backgroundColor = UIColor(red: 248.0/255.0, green: 192.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        thirdButton.tintColor = UIColor.white
    }
    
    func setBtnColorsLight() {
        firstButton.tintColor = UIColor(red: 210.0/255.0, green: 64.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        firstButton.backgroundColor = UIColor.white
        
        secondButton.tintColor = UIColor(red: 223.0/255.0, green: 111.0/255.0, blue: 37.0/255.0, alpha: 1.0)
        secondButton.backgroundColor = UIColor.white
        
        thirdButton.tintColor = UIColor(red: 248.0/255.0, green: 192.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        thirdButton.backgroundColor = UIColor.white
    }
}

