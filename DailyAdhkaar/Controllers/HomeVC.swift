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
        
        navigationController?.navigationBar.backgroundColor = UIColor(named: "ThemeColor")
        navigationController?.navigationBar.barTintColor = UIColor(named: "ThemeColor")
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.backgroundColor = UIColor(named: "ThemeColor")
        
        duas = DataManager.shared.getAll()
        print (duas)
        self.title = "أذكارُ  الصباح والمساء"
        self.tableView.register(UINib(nibName: "DuaCell", bundle: .main), forCellReuseIdentifier: "CellID")
        self.tableView.allowsSelection = false
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
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
//        headerView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        let headerView = UINib(nibName: "SectionCell", bundle: .main).instantiate(withOwner: nil, options: nil)[0] as! SectionCell
//        headerView.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44)
        headerView.backgroundColor = .clear
        
        headerView.duaIndex.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        headerView.duaIndex.text = String(section + 1)
        return headerView
    }
    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//        //footerView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
//        return footerView
//    }
//
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        70.0
//        let headerView = UINib(nibName: "SectionCell", bundle: .main).instantiate(withOwner: nil, options: nil)[0] as! SectionCell
//        return headerView.frame.height
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        1.0
    }
}
