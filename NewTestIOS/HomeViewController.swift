//
//  ViewController.swift
//  NewTestIOS
//
//  Created by Borqs India on 15/03/20.
//  Copyright © 2020 Vishal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
   
    //MARK:- UI Compenents
    fileprivate let cellId = "cellId"
    fileprivate lazy var tableInfoList: UITableView = {
       let tb = UITableView()
        tb.delegate = self
        tb.dataSource = self
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(HomeInfoTableViewCell.self, forCellReuseIdentifier: cellId)
        return tb
    }()

    var activity = UIActivityIndicatorView()
    
    //MARK:- Data Variables
    var arrayInfoList = [DataInfoViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUIForViews()
        fetchDataFromAPI()
    }
    
    //MARK:- Set UI for views
    func setUpUIForViews() -> Void {
        let refresh = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(fetchDataFromAPI))
        self.navigationItem.rightBarButtonItem  = refresh
    
        view.backgroundColor = .white
        view.addSubview(tableInfoList)
        
        let views = ["table":self.tableInfoList]

        var constraints =  NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[table]-0-|", options: NSLayoutConstraint.FormatOptions.alignAllTop, metrics: nil, views: views)
        self.view.addConstraints(constraints)

        let stringConstraint = "V:|-0-[table]-0-|"

        constraints =  NSLayoutConstraint.constraints(withVisualFormat: stringConstraint, options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: views)
        self.view.addConstraints(constraints)
    }
    
    //MARK:- Fetch Data from API, assign to array, Populate table View and assign To table View Cell
    @objc func fetchDataFromAPI() {
        if ReachabilityCheck.isConnectedToNetwork(){
            showActivityIndicator()
            NetworkApiManager.sharedNetworkApiManager.getDataFromUrl(BaseUrlPath) { (dt: DataInfo?, err: Error?) in
                if let _ = err{
                    DispatchQueue.main.async {
                        self.hideActivity()
                         UIAlertHelper.presentAlertOnController(self, title: AlertMessages.AlertTitle, message: AlertMessages.CommonError)
                    }
                    return
                }
                if let data = dt{
                    //Map data Model Object to view model object
                    self.arrayInfoList = data.rows.map({ (rowObj: RowInfo) -> DataInfoViewModel in
                        return DataInfoViewModel(dataInfo: rowObj)
                    })
                    DispatchQueue.main.async {
                        self.tableInfoList.reloadData()
                        self.hideActivity()
                        self.navigationItem.title = data.title ?? "InfoView"
                    }
                }
            }
        }else{
    
            UIAlertHelper.presentAlertOnController(self, title: AlertMessages.AlertTitle, message: AlertMessages.MessageInfo)
    }
}
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableInfoList.dequeueReusableCell(withIdentifier: cellId) as! HomeInfoTableViewCell
        let obj = arrayInfoList[indexPath.row]
        cell.dataInfoModel = obj
        return cell
    }
    
}

//MARK:- For showing Activity Indicator
extension HomeViewController{
    func showActivityIndicator() {
        if #available(iOS 13.0, *) {
            activity = UIActivityIndicatorView(style: .large)
        } else {
            // Fallback on earlier versions
            activity = UIActivityIndicatorView(style: .whiteLarge)
        }
        activity.center = view.center
        activity.color = .red
        activity.hidesWhenStopped = true
        view.addSubview(activity)
        activity.startAnimating()
    }
    
    func hideActivity() {
        activity.stopAnimating()
    }
}

