//
//  EmpListViewController.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

//
//  ViewController.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON

class EmpListViewController: UIViewController {
    lazy var searchBar = UISearchBar()
    lazy var tableView = UITableView()
    var arrRes = [Employee]()
    private let apiFetcher = APIRequestFetcher()
    
    private var searchResults = [JSON]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadList()
    }

    private func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EmployeeListCell.self, forCellReuseIdentifier: "cell")
        
        tableView.tableHeaderView = searchBar
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
    }
    
    private func loadList() {
        EmployeeListAPI.getEmployees { [weak self] result in
           switch result {
           case .success(let list):
               print(list)
               self?.arrRes = list
               self?.tableView.reloadData()
           case .failure(let error):
               print(error.localizedDescription)
           }
       }
    }
    
    deinit {
        print("EmpListViewController deinit")
    }
}


extension EmpListViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: EmployeeListCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmployeeListCell
        cell.employees = arrRes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
        return footerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 //Height of row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        openDetail(for: arrRes[indexPath.row])
    }
    
    func openDetail(for employee: Employee) {
        if let emp_id = employee.employeeId {
            let stringId = String(emp_id)
            let vc = EmpDetailViewController(id: stringId)
//            self.present(vc, animated: true, completion: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        searchResults.removeAll()
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchResults.removeAll()
    }
    
//    func fetchResults(for text: String) {
//        print("Text Searched: \(text)")
//        apiFetcher.search(searchText: text, completionHandler: {
//            [weak self] results, error in
//            if case .failure = error {
//                return
//            }
//            
//            guard let results = results, !results.isEmpty else {
//                return
//            }
//            
//            self?.searchResults = results
//        })
//    }
}
