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
        label.font = App.Font.bold(size: 26)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.bold(size: 26)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.medium(size: 18)
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
    
    lazy var pointsLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.medium(size: 16)
        label.textColor = .systemTeal
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var imageView = UIImageView()
    

    
//    imageView.contentMode = .scaleAspectFit
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI(){
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        
        addSubview(firstNameLabel)
        addSubview(lastNameLabel)
        addSubview(roleLabel)
        addSubview(pointsLabel)
        addSubview(imageView)
        
        firstNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.left.equalTo(imageView.snp.right).offset(16)
            self.setContentHuggingPriority(UILayoutPriority.fittingSizeLevel, for: NSLayoutConstraint.Axis.horizontal)
        }
        
        lastNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(18)
            make.left.equalTo(firstNameLabel.snp.right).offset(8)
            self.setContentHuggingPriority(UILayoutPriority.fittingSizeLevel, for: NSLayoutConstraint.Axis.horizontal)
        }
        
        roleLabel.snp.makeConstraints { make in
//            make.top.equalTo(firstNameLabel.snp.bottom).offset(1)
            make.left.equalTo(imageView.snp.right).offset(16)
//            make.right.equalToSuperview().offset(12)
            make.bottom.equalTo(-24)
        }
        
        pointsLabel.snp.makeConstraints{ make in
            make.left.equalTo(imageView.snp.right).offset(16)
            make.top.equalTo(roleLabel.snp.bottom).offset(3)
        }
        
        imageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(18)
            make.left.equalToSuperview().offset(22)
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
    }
}
