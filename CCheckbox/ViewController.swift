//
//  ViewController.swift
//  CCheckbox
//
//  Created by Mohamed Salah on 7/23/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- IBOutlets
    
    @IBOutlet weak var checkboxOne: CCheckbox!
    @IBOutlet weak var checkboxTwo: CCheckbox!
    @IBOutlet weak var checkboxThree: CCheckbox!
    
    //MARK:- Variables
    
    
    //MARK:- Segues
    
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        checkboxOne.delegate = self
        checkboxTwo.delegate = self
        checkboxThree.delegate = self
        
        //set custom animation
        checkboxOne.animation = .showHideTransitionViews
    }
    
    //MARK:- Configuratiuon
    
    
    //MARK:- IBActions
    
}

extension ViewController: CheckboxDelegate {
    func didSelect(_ checkbox: CCheckbox) {
        switch checkbox {
        case checkboxOne:
            print("checkbox one selected")
            break
        case checkboxTwo:
            print("checkbox two selected")
            break
        case checkboxThree:
            print("checkbox three selected")
            break
        default:
            break
        }
    }
    
    func didDeselect(_ checkbox: CCheckbox) {
        switch checkbox {
        case checkboxOne:
            print("checkbox one deselected")
            break
        case checkboxTwo:
            print("checkbox two deselected")
            break
        case checkboxThree:
            print("checkbox three deselected")
            break
        default:
            break
        }
    }
}
