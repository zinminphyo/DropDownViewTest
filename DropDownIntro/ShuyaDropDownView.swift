//
//  ShuyaDropDownView.swift
//  DropDownIntro
//
//  Created by zin min phyo on 08/03/2022.
//

import Foundation
import UIKit

protocol ShuyaDropDownViewDataSource {
    func shuyaDropDownNumberOfLists() -> Int
    func shuyaDropDown(itemAt: Int) -> ShuyaDropDownModel
}

protocol ShuyaDropDownModel{
    func getTitle() -> String
}


class ShuyaDropDownView: UIView {
    
    let tableView = UITableView()
    var dataSource: ShuyaDropDownViewDataSource!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTableView()
    }
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func attachToView(_ view: UIView) {
        tableView.dataSource = self
        tableView.delegate = self
        self.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y + view.frame.height, width: view.frame.width, height: CGFloat(dataSource.shuyaDropDownNumberOfLists()) * 40.0)
    }
    
    
}


extension ShuyaDropDownView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.shuyaDropDownNumberOfLists()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataSource.shuyaDropDown(itemAt: indexPath.row).getTitle()
        return cell
    }
    
    
}

extension ShuyaDropDownView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}

