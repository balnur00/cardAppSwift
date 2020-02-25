//
//  EmployeeDetailView.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/11/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class EmployeeDetailView: UIView {
    lazy var firstNameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 30)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 30)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.medium(size: 25)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var skillNameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.medium(size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var skillTypeLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.medium(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var skillLevelLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.medium(size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)
        addSubview(roleLabel)
        
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(22)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(firstNameLabel.snp.right).offset(12)
        }
        
        roleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(12)
        }
    }
}
