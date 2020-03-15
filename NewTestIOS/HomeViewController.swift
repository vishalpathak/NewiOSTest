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
    var tableInfoList = UITableView()
    fileprivate let cellId = "cellId"
    
    //MARK:- Data Variables
    var arrayInfoList = [RowInfo]()
    
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
        tableInfoList.delegate = self
        tableInfoList.dataSource = self
        tableInfoList.frame = view.frame
        tableInfoList.register(HomeInfoTableViewCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableInfoList)
    }
    
    //MARK:- Fetch Data from API, assign to array, Populate table View and assign To table View Cell
    @objc func fetchDataFromAPI() {
        NetworkApiManager.sharedNetworkApiManager.getDataFromUrl(BaseUrlPath) { (dt: DataInfo?, err: Error?) in
            if let error = err{
                self.arrayInfoList.removeAll()
                DispatchQueue.main.async {
                    //self.loader.hideActivity(view: self.view)
                    self.tableInfoList.reloadData()
                }
                print("Error In API data:\(error)")
                return
            }
            if let data = dt{
                self.arrayInfoList = data.rows
                DispatchQueue.main.async {
                    self.tableInfoList.reloadData()
                    //self.loader.hideActivity(view: self.view)
                    self.navigationItem.title = data.title ?? "InfoView"
                }
            }
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
        cell.setData(data: obj)
        return cell
    }
    
}

