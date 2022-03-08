//
//  ViewController.swift
//  DropDownIntro
//
//  Created by zin min phyo on 08/03/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var clickMeBtn: UIButton!
    
    let transparentView = UIView()
    let dropDownView = ShuyaDropDownView()
    
    let items = [
        DropDownItem(name: "First"),
        DropDownItem(name: "Second"),
        DropDownItem(name: "Third"),
        DropDownItem(name: "Fourth")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        transparentView.frame = CGRect.zero
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(actionForDismiss(_:)))
        transparentView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func actionForDismiss(_ sender: UITapGestureRecognizer) {
        dropDownView.removeFromSuperview()
        transparentView.removeFromSuperview()
    }

    @IBAction func didTapClickMeBtn(_ sender: UIButton) {
        self.view.addSubview(transparentView)
        transparentView.frame = self.view.frame
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.view.addSubview(dropDownView)
        dropDownView.dataSource = self
        dropDownView.attachToView(clickMeBtn)
    }

}


extension ViewController: ShuyaDropDownViewDataSource {
    func shuyaDropDownNumberOfLists() -> Int {
        items.count
    }
    
    func shuyaDropDown(itemAt: Int) -> ShuyaDropDownModel {
        items[itemAt]
    }
}
