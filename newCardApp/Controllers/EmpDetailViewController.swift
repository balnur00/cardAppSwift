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
    var skillsResult = [SkillTypeModel]()
    

    let tableView = UITableView(frame: .zero, style: .grouped)
    
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return skillsResult.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skillsResult[section].items.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SkillTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SkillTableViewCell
        cell.skills = skillsResult[indexPath.section].items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x:0, y:0, width:tableView.frame.size.width, height:1))
        return footerView
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return skillsResult[section].type
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
        
        var hardList = [SkillModel]()
        var softList = [SkillModel]()
        
        res.skills.forEach { s in
            guard let type = s.type else { return }
            if type == "hard skill" {
                let hs = SkillModel(id: s.id, name: s.name, level: s.level, type: s.type)
                hardList.append(hs)
            } else if type == "soft skill" {
                let ss = SkillModel(id: s.id, name: s.name, level: s.level, type: s.type)
                softList.append(ss)
            }
        }
        let hard = SkillTypeModel(type: "hard skill", items: hardList)
        let soft = SkillTypeModel(type: "soft skill", items: softList)
        self.skillsResult = [soft, hard]
        setImage(from: res.photo)
        tableView.reloadData()
    }
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.employeeView.imageView.image = image
            }
        }
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
        
        tableView.tableHeaderView = employeeView
        
        tableView.register(SkillTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
