//
//  RRButton.swift
//  RelayRace
//
//  Created by Pedro on 06-10-16.
//  Copyright © 2016 Dreamsit. All rights reserved.
//

import UIKit

//private let globalInstance = RRButton()
private let tag1 = 99

public enum RRButtonType:String{
    case Reload = "Reload", Error = "Error loading content", NoActivities = "No activities"
}

public class RRButton:UIView {
    var tapHandler:(Void->Void)!
    var view: UIView!
    var viewToCenterY: UIView!
    var type: RRButtonType!
    
    init(view: UIView, viewToCenterY: UIView, type: RRButtonType, tapHanlder: Void -> Void) {
        self.tapHandler = tapHanlder
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        let errorButton = UIButton(type: .System)
        errorButton.backgroundColor = Colors.startGreen
        errorButton.translatesAutoresizingMaskIntoConstraints = false
        errorButton.setTitle(type.rawValue, forState: .Normal)
        errorButton.setImage(UIImage(named: "ic_action_autorenew"), forState: .Normal)
        errorButton.setTitleColor(Colors.white, forState: .Normal)
        errorButton.tintColor = Colors.white
        
        self.userInteractionEnabled = true
        self.addSubview(errorButton)
        view.addSubview(self)
        self.clipsToBounds = true
        
        NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: viewToCenterY, attribute: .CenterY, multiplier: 1, constant: 0).active = true
        //self.centerYAnchor.constraintEqualToAnchor(viewToCenterY.centerYAnchor).active = true
        NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0).active = true
        //self.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 18).active = true
        NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0).active = true
        //self.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -18).active = true
        NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 40).active = true
        //self.heightAnchor.constraintEqualToConstant(40).active = true
        
        NSLayoutConstraint(item: errorButton, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0).active = true
        //errorButton.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        NSLayoutConstraint(item: errorButton, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: 0).active = true
        //errorButton.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
        NSLayoutConstraint(item: errorButton, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: 0).active = true
        //errorButton.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
        NSLayoutConstraint(item: errorButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0).active = true
        //
        //errorButton.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        
        self.tag = RRButton.getTag()
        print(self)
        
        errorButton.addTarget(self, action: #selector(RRButton.removeErrorButton(_:)), forControlEvents: .TouchUpInside)
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    
    func removeErrorButton(sender: UIButton) {
        print(sender)
        sender.removeFromSuperview()
        sender.superview?.removeFromSuperview()
        self.tapHandler()
    }
}

extension RRButton {
    public static func show(view: UIView, viewToCenterY: UIView, type: RRButtonType, tapHanlder: Void -> Void) {
        //globalInstance.show(view, viewToCenterY: viewToCenterY, type: type, tapHanlder: tapHanlder)
        let _ = RRButton(view: view, viewToCenterY: viewToCenterY, type: type, tapHanlder: tapHanlder)
    }
    
    public static func getTag() -> Int {
        return tag1
    }
}
