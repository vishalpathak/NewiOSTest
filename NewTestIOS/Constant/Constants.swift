//
//  Constants.swift
//  NewTestIOS
//
//  Created by Borqs India on 15/03/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import Foundation

//Base Url API for fetching data from server
let BaseUrlPath = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

//Http Response codes
struct HttpResponse {
    static let ResponseSuccess = 200
    static let ResponseNotFound = 404
}

struct AlertMessages {
    static let AlertTitle = "Error"
    static let MessageInfo = "Internet is not connected. Please check settings."
    static let ButtonTitle = "OK"
    static let CommonError = "Something went wrong please try after sometime."
}

struct DefaultStrings{
    static let DefaultNavigationTitle = "InfoView"
    static let DefaultTitle = "Sorry! title not available"
    static let DefaultDescription = "Sorry! description not available"
    static let DefaultImageNotAvailable = "Image not available now."
}

struct CommonText {
    static let CommonTitle = "Title:"
    static let CommonDescription = "Description:"
}
