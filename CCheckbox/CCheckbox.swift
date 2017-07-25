//
//  CCheckbox.swift
//  MOF
//
//  Created by Mohamed Salah on 7/16/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

/**
    CheckboxDelegate protocol to be confirmed 
    when you need callbacks for checkboc status change
 **/
protocol CheckboxDelegate {
    func didSelect(_ checkbox: CCheckbox)
    func didDeselect(_ checkbox: CCheckbox)
}

/**
 CCheckbox is a custom UIButton class 
 which represents custom checkbox with
 custom images
 **/

@IBDesignable
class CCheckbox: UIButton {
    //MARK:- Variables
    private var checkboxImage: UIImageView!
    
    @IBInspectable var normalImage: UIImage? {
        didSet {
            checkboxImage.image = normalImage
        }
    }
    
    @IBInspectable var selectedImage: UIImage?
    
    
    /// when set this variable checkbox status changed
    var isCheckboxSelected: Bool = false {
        didSet {
            self.changeStatus()
        }
    }
    
    var delegate: CheckboxDelegate!
    var animation: UIViewAnimationOptions = .transitionCrossDissolve
    
    //MARK:- init Section
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initComponent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initComponent()
    }
    
    private func initComponent () {
        
        //Check Button Type Value
        if self.buttonType != .system
            && self.buttonType != .custom {
            
            fatalError("Button Type Error. Please Make Button Type System or Custom")
        }
        
        // build component frame
        let componentsFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        // adding imageView to the CCheckbox view using its frame
        checkboxImage = UIImageView(frame: componentsFrame)
        checkboxImage.image = normalImage
        checkboxImage.contentMode = .scaleAspectFit
        
        self.addSubview(checkboxImage)
        
        self.setImage(nil, for: .normal)
        self.setTitle("", for: .normal)
        self.addTarget(self,
                              action: #selector(CCheckbox.didTouchUpInside(_:)),
                              for: .touchUpInside)
        
        //Styling UIView
        self.backgroundColor = UIColor.clear
    }
    
    //MARK:- Checkbox Status
    private func changeStatus() {
        if isCheckboxSelected {
            UIView.transition(with: self.checkboxImage,
                                      duration:0.5,
                                      options: animation,
                                      animations: { self.checkboxImage.image = self.selectedImage },
                                      completion: nil)
            
            
        } else {
            UIView.transition(with: self.checkboxImage,
                              duration:0.5,
                              options: animation,
                              animations: { self.checkboxImage.image = self.normalImage },
                              completion: nil)
        }
        
    }
    
    // MARK: IBActions
    func didTouchUpInside(_ sender: UIButton) {
        self.isCheckboxSelected = !self.isCheckboxSelected
        
        
        if isCheckboxSelected && delegate != nil {
            delegate.didSelect(self)
        } else if delegate != nil {
            delegate.didDeselect(self)
        }
    }
    
}
