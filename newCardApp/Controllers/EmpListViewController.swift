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
import PaginatedTableView

class EmpListViewController: UIViewController {
    lazy var searchBar = UISearchBar()
    lazy var tableView = UITableView(frame: .zero, style: .plain)
    var responseApi = Response()
    var employeeList = [Employee]()
    var newEmployeeList = [Employee]()
    private var filteredEmployees = [Employee]()
    private let refreshControl = UIRefreshControl()
    private var fetchingMore = false
//    private var indicator = UIActivityIndicatorView()
    private let spinner = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadList()
        self.spinner.isHidden = true
        self.spinner.hidesWhenStopped = true
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
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        
        searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 70)
        searchBar.delegate = self
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        
    }
    
    private func loadList() {
        EmployeeListAPI.getEmployees { [weak self] result in
           switch result {
           case .success(let res):
               self?.employeeList = res.results
               self?.responseApi = res
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
        if searchBar.text != "" {
            cell.employees = filteredEmployees[indexPath.row]
        } else {
            cell.employees = employeeList[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
        return footerView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchBar.text != "" {
            return filteredEmployees.count
        }
        return employeeList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 //Height of row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        openDetail(for: employeeList[indexPath.row])
    }
    
    func openDetail(for employee: Employee) {
        if let emp_id = employee.employeeId {
            let stringId = String(emp_id)
            let vc = EmpDetailViewController(id: stringId)
            // MARK: - Show view controller
//            self.present(vc, animated: true, completion: nil)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    // MARK: - Searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredEmployees.removeAll()
        filterEmployees (for: searchBar.text ?? "")
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("---------------------------------------------------------")
        print("button clicked ")
        filterEmployees (for: searchBar.text ?? "")
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchResults.removeAll()
        searchBar.text = ""
        searchBar.showsCancelButton = false
        searchBar.endEditing(true)
    }
    func filterEmployees (for searchText: String) {
        filteredEmployees.removeAll()
        filteredEmployees = employeeList.filter { e in
            return e.firstname.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    private func calculateIndexPathsToReload(from newEmployeeList: [Employee]) -> [IndexPath] {
      let startIndex = employeeList.count - newEmployeeList.count
      let endIndex = startIndex + newEmployeeList.count
      return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
    
    @objc private func refresh(_ sender: Any){
        DispatchQueue.main.async{
            EmployeeListAPI.getMoreEmployees(1) { [weak self] result in
                switch result {
                case .success(let res):
                    self?.fetchingMore = false
                    self?.employeeList = res.results
                    self?.responseApi = res
                    print("============================================")
                    print("refresh started")
                    print(self?.employeeList)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        self.refreshControl.endRefreshing()
    }
    
    private func fetchMoreCells(){
//        print("============================================")
//        print("fetching started")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25, execute: {
            self.loadMore()
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        })
    }
    private func loadMore() {
        if responseApi.has_more == true {
            self.spinner.isHidden = false
            self.spinner.startAnimating()
            responseApi.currentPage += 1
            self.fetchingMore = false
            EmployeeListAPI.getMoreEmployees(responseApi.currentPage) { [weak self] result in
                switch result {
                case .success(let res):
                    self?.employeeList += res.results
                    self?.responseApi = res
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }else{
            self.spinner.isHidden = true
            self.spinner.hidesWhenStopped = true
            self.spinner.stopAnimating()
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            // print("this is the last cell")
            if !fetchingMore && indexPath.row == lastRowIndex {
                spinner.startAnimating()
                self.fetchingMore = true
                fetchMoreCells()
            }
            spinner.color = .red
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))

            self.tableView.tableFooterView = spinner
        }
    }
}
