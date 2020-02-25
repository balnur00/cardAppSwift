//
//  EmpDetailViewController.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/7/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class EmpDetailViewController: UIViewController {
    var passedValue:String
    var res: Employee?
    var skillsResult = [SkillModel]()
    
    let tableView = UITableView()
    
    lazy var employeeView = EmployeeDetailView()
    
    init(id: String) {
        self.passedValue = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
        loadDetail()
        updateView()
    }
    
    private func loadDetail() {
        EmployeeDetailAPI.getEmployeeDetails(id: passedValue) { [weak self] result in
           switch result {
           case .success(let detail):
               print(detail)
               self?.res = detail
               self?.updateView()
               
           case .failure(let error):
               print(error.localizedDescription)
           }
        }

    }
    
    deinit {
        print("EmpDetailViewController deinit")
    }

}

extension EmpDetailViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillsResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SkillTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SkillTableViewCell
        cell.skills = skillsResult[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return employeeView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
        return footerView
    }
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        
    }
    
    func updateView(){
        guard let res = self.res else {
            return
        }
        employeeView.firstNameLabel.text = res.firstname
        employeeView.lastNameLabel.text = res.lastname
        employeeView.roleLabel.text = res.role
        res.skills.forEach { s in
            let skills = SkillModel(id: s.id, name: s.name, level: s.level, type: s.type)
            skillsResult.append(skills)
        }
        tableView.reloadData()
    }

    private func setupUI() {
        view.backgroundColor = .white
//        updateView(view: employeeView)
//        self.view.addSubview(employeeView)
            
//        employeeView.snp.makeConstraints { make in
//            make.top.left.right.equalToSuperview()
//        }
        
//        navigationController?.popViewController(animated: self)
//        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60

        tableView.register(SkillTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
