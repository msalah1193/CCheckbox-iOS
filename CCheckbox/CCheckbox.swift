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
 CCheckbox is a custom UIView class 
 which represents custom checkbox with
 custom images
 **/

@IBDesignable
class CCheckbox: UIView {
    //MARK:- Variables
    private var checkboxImage: UIImageView!
    private var checkboxBtn: UIButton!
    
    @IBInspectable var normalImage: UIImage? {
        didSet { checkboxImage.image = normalImage }
    }
    
    @IBInspectable var selectedImage: UIImage?
    
    
    /// when set this variable checkbox status changed
    var isSelected: Bool = false {
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
        // build component frame 
        let componentsFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        // adding imageView to the CCheckbox view using its frame
        checkboxImage = UIImageView(frame: componentsFrame)
        checkboxImage.image = normalImage
        checkboxImage.contentMode = .scaleAspectFit
        
        self.addSubview(checkboxImage)
        
        // adding button to the CCheckbox view using its frame
        checkboxBtn = UIButton(frame: componentsFrame)
        checkboxBtn.setTitle("", for: .normal)
        
        checkboxBtn.addTarget(self,
                              action: #selector(CCheckbox.didTouchUpInside(_:)),
                              for: .touchUpInside)
        
        self.addSubview(checkboxBtn)
        
        //Styling UIView
        self.backgroundColor = UIColor.clear
    }
    
    //MARK:- Checkbox Status
    private func changeStatus() {
        if isSelected {
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
        self.isSelected = !self.isSelected
        
        
        if isSelected && delegate != nil {
            delegate.didSelect(self)
        } else if delegate != nil {
            delegate.didDeselect(self)
        }
    }
    
}
