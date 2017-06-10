//
//  File.swift
//  16_lesson_pageViewContoller
//
//  Created by Ika Javakhishvili on 05/1/17.
//  Copyright © 2017 Ika Javakhishvili. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TableViewCell: UITableViewCell {
    
}
