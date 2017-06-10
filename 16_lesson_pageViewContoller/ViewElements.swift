//
//  ViewElements.swift
//  16_lesson_pageViewContoller
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import Foundation
import UIKit


class ViewElements {
    var view: UIView
    
    init(view: UIView) {
        self.view = view
    }
    
    
    let collectionViewParent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let TableViewParent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: UITableViewStyle.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    func addWrappingConstraints(fromView: UIView, forView: UIView) {
        fromView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": forView]))
        fromView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": forView]))
    }
    
    func generateViews() {
        view.addSubview(collectionViewParent)
        view.addSubview(TableViewParent)
        collectionViewParent.addSubview(collectionView)
        TableViewParent.addSubview(tableView)
        addWrappingConstraints(fromView: collectionViewParent, forView: collectionView)
        addWrappingConstraints(fromView: TableViewParent, forView: tableView)
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": collectionViewParent]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v": TableViewParent]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-250-[v1(100)][v2]-50-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1": collectionViewParent, "v2": TableViewParent]))

    }
    
    
}
