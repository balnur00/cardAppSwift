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

    
    lazy var tableView = UITableView()
    var arrRes = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        loadList()
    }

    private func setupUI() {
        view.backgroundColor = .purple
        view.addSubview(tableView)
        tableView.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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


extension EmpListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let item = arrRes[indexPath.row]
        cell.textLabel?.text = item.firstname
        cell.detailTextLabel?.text = item.lastname
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
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
        
//        navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
    }
    

}

