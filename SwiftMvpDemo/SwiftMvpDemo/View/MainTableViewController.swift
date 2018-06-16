//
//  MainTableViewController.swift
//  SwiftMvpDemo
//
//  Created by 秦威 on 2018/6/16.
//  Copyright © 2018年 秦威. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    var presenter = MainPresenter()
    
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        presenter.delegate = self
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

extension MainTableViewController : MainPresenterDelegate {
    func startLoad() {
        print("start loading...")
    }
    
    func endLoad() {
        print("end loading...")
    }
    
    func setPeople(people: [Person]) {
        self.people = people
        tableView.reloadData()
    }
    
    func setEmpty() {
        print("empty view...")
    }
    
    
}


