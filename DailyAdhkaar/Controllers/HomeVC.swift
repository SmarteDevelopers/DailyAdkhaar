//
//  HomeVC.swift
//  DailyAdhkaar
//
//  Created by AbuTalha on 23/12/2021.
//

import UIKit

class HomeVC: UITableViewController {

    var duas = [Dua]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        duas = DataManager.shared.getAll()
        print (duas)
        self.title = "Daily Adhkaar"
        self.tableView.register(UINib(nibName: "DuaCell", bundle: .main), forCellReuseIdentifier: "CellID")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return duas.count
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return duas[section].group.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! DuaCell
        cell.indexPath = indexPath
        cell.updateCell(dua: duas[indexPath.section])
        return cell
    }
}
