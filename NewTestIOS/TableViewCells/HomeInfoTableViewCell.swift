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
   
    //MARK:- UI Compenents
    fileprivate let titleLable: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.numberOfLines = 0
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
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
    
    //MARK:- ViewModel Object set data to UI object using ViewModel
    var dataInfoModel: DataInfoViewModel? {
        didSet{
            titleLable.text = "\(CommonText.CommonTitle) \(dataInfoModel?.title ?? DefaultStrings.DefaultTitle)"
            descriptionLabel.text = "\(CommonText.CommonDescription) \(dataInfoModel?.description ?? DefaultStrings.DefaultDescription)"
            let newUrl = URL(string: dataInfoModel?.imageInfo ?? "")
            if let imageInfo = self.infoImage{
                imageInfo.sd_imageIndicator = SDWebImageActivityIndicator.gray
                imageInfo.sd_setImage(with: newUrl) { (image, error, cache, urls) in
                    if (error != nil) {
                        // Failed to load image
                        imageInfo.image = nil
                    } else {
                        // Successful in loading image
                        imageInfo.image = image
                    }
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLable)
        addSubview(descriptionLabel)
        if let imgView = infoImage{
            addSubview(imgView)
        }
        
        setUpAutoLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpAutoLayOut() {
        
        let constraints = [titleLable.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                           titleLable.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           titleLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                           
                           descriptionLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 16),
                           descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                           
                           infoImage!.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
                           infoImage!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                           infoImage!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                           infoImage!.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
