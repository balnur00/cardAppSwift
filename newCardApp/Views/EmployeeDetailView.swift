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
        label.font = App.Font.bold(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.medium(size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
//    lazy var Label: UILabel = {
//        let label = UILabel()
//        label.font = App.Font.medium(size: 14)
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        return label
//    }()
    
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
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(200)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalTo(firstNameLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        
        roleLabel.snp.makeConstraints { make in
            make.top.equalTo(lastNameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(12)
            make.width.height.equalTo(18)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}
