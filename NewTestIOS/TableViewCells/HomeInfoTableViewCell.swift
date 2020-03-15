//
//  HomeInfoTableViewCell.swift
//  NewTestIOS
//
//  Created by Borqs India on 15/03/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import UIKit
import SDWebImage

class HomeInfoTableViewCell: UITableViewCell {
    fileprivate let titleLable: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.numberOfLines = 0
        return title
    }()
    
    fileprivate let descriptionLabel: UILabel = {
       let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textColor = .black
        description.numberOfLines = 0
        return description
    }()
    
    fileprivate var infoImage: UIImageView? = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    
}
