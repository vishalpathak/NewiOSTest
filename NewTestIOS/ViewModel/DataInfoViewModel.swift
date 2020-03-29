//
//  DataInfoViewModel.swift
//  NewTestIOS
//
//  Created by Borqs India on 29/03/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import Foundation

struct DataInfoViewModel {
    let title: String
    let description: String
    let imageInfo: String
    
    //Dependency Injection DI
    init(dataInfo: RowInfo) {
        self.title = dataInfo.title ?? DefaultStrings.DefaultTitle
        self.description = dataInfo.description ?? DefaultStrings.DefaultDescription
        self.imageInfo = dataInfo.imageHref ?? ""
    }
}
