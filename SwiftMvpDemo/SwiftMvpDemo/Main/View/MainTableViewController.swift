//
//  MainTableViewController.swift
//  SwiftMvpDemo
//
//  Created by 秦威 on 2018/6/16.
//  Copyright © 2018年 秦威. All rights reserved.
//

import UIKit

class MainTableViewController: BaseTableViewController {

    var presenter = MainPresenter()
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        presenter.attachView = self
        presenter.getPeople()
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = people[indexPath.row].name

        return cell
    }
    
}

// MARK: - 实现Presenter的代理方法，根据数据刷新UI
extension MainTableViewController : MainPresenterDelegate {
    
    func startLoad() {
        print("start loading...")
    }
    
    func endLoad() {
        print("end loading...")
    }
    
    func setPeople(people: [Person]) {
        print("tableview  \(people)")
        self.people = people
        tableView.reloadData()
    }
    
    func setEmpty() {
        print("empty view...")
    }
    
    
}


