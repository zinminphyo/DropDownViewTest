//
//  DropDownView.swift
//  DropDownIntro
//
//  Created by zin min phyo on 08/03/2022.
//

import Foundation
import UIKit




class DropDownView: UIView {
    
    let transparentView = UIView()
    let tableView = UITableView()
    
    var parentView: UIView!
    var contentView: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHierarchy()
    }
    
    
    private func configureHierarchy() {
        configureTransparentView()
        configureTableView()
    }
    
    
    private func configureTransparentView() {
        addSubview(transparentView)
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.dataSource = self
        tableView.layer.cornerRadius = 5
        
    }
    
    func attachToView(_ view: UIView, _  parentView: UIView) {
//        self.frame = CGRect.init(x: view.frame.origin.x, y: view.frame.origin.y + view.frame.height, width: view.frame.width, height: 150)
        self.parentView = parentView
        self.contentView = view
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutParentView()
        layoutTableView()
    }
    
    func layoutParentView() {
        parentView.frame = self.frame
    }
    
    func layoutTableView() {
        tableView.frame = contentView.frame
    }
    
}


extension DropDownView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Testing"
        return cell
    }
    
}
