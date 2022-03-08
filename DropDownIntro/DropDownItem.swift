//
//  DropDownItem.swift
//  DropDownIntro
//
//  Created by zin min phyo on 08/03/2022.
//

import Foundation


struct DropDownItem: ShuyaDropDownModel {
    let name: String
    
    func getTitle() -> String {
        return name
    }
}
