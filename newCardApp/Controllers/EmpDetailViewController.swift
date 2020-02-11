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
    var res = Employee()
    
    lazy var employeeView: EmployeeDetailView = {
        let view = EmployeeDetailView()

        view.firstNameLabel.text = res.firstname
        view.lastNameLabel.text = res.lastname
        view.roleLabel.text = res.role
        return view
    }()
    
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

extension EmpDetailViewController {
    override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
        
    }
    func updateView(){
        employeeView.firstNameLabel.text = res.firstname
        employeeView.lastNameLabel.text = res.lastname
        employeeView.roleLabel.text = res.role
    }
    

    private func setupUI() {
        view.backgroundColor = .white
//        updateView(view: employeeView)
        self.view.addSubview(employeeView)
            
        employeeView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
//        navigationController?.popViewController(animated: self)
//        self.dismiss(animated: true, completion: nil)
    }
}
