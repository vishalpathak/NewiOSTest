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
    var arrayInfoList:[String] = ["aa", "bb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUIForViews()
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
    
    @objc func fetchDataFromAPI() {
        
    }


}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableInfoList.dequeueReusableCell(withIdentifier: cellId) as! HomeInfoTableViewCell
        //let obj = arrayInfoList[indexPath.row]
        cell.textLabel?.text = arrayInfoList[indexPath.row]
        //cell.setData(data: obj)
        return cell
    }
    
}

