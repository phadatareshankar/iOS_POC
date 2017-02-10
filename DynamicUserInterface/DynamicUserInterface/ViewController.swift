//
//  ViewController.swift
//  DynamicUserInterface
//
//  Created by Phadatare, Shankar (Syntel) on 2/9/17.
//  Copyright © 2017 Phadatare, Shankar (Syntel). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let balanceCard:BalanceCardViewController = BalanceCardViewController();
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BalanceCardViewController") as! BalanceCardViewController
        
        controller.view.frame = CGRect(x: 0, y: 10, width: self.view.frame.size.width, height: self.view.frame.size.height);
        controller.view.backgroundColor = UIColor.brown
        
        controller.firstNameLbl.text = "Shankar"
        controller.lastNameLbl.text = "Phadatare"
        controller.phoneNumberLbl.text = "22222222"
        controller.addressLbl.isHidden = true;
//        controller.view.setNeedsUpdateConstraints()
//        controller.view.updateConstraintsIfNeeded()
//        controller.view.layoutIfNeeded()
        
        
        controller.view = self.resizeToFitSubviews(view: controller.view)
        
        self.addChildViewController(controller)
        self.view.addSubview(controller.view);
        
        
        
        
        if controller.addressLbl.isHidden {
            controller.phoneNoLabelTopConstraint.constant = ((controller.addressLbl.frame.origin.y - controller.lastNameLbl.frame.origin.y) - (controller.lastNameLbl.frame.size.height));
            
        }else{
            controller.addressLbl.text = "437A allen ct"
            controller.phoneNoLabelTopConstraint.constant = ((controller.phoneNumberLbl.frame.origin.y-controller.lastNameLbl.frame.origin.y)-(controller.addressLbl.frame.size.height))
        }
        
        
        controller.view.layoutIfNeeded()
        
        
        
    }
    
    func resizeToFitSubviews(view: UIView) -> UIView {
        //var width: CGFloat = 0
        var height: CGFloat = 0
        var hiddenViewHeight: CGFloat = 0
        
        for someView in view.subviews {
            let aView = someView as UIView
            if !someView.isHidden {
                height = aView.frame.origin.y + aView.frame.height
                
                //height = max(height, newHeight)
                
            }else{
                
                hiddenViewHeight += aView.frame.height
            }
            
        }
        
        view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: view.frame.size.width, height: (height-hiddenViewHeight))
        
        print("view Height: \(view.frame.size.height)")  //view Height: 168.0
        view.sizeToFit()
        return view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

