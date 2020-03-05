//
//  EmployeeListCell.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/27/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import UIKit

class EmployeeListCell : UITableViewCell {
    private lazy var firstNameLbl: UILabel = {
        let label = UILabel()
        label.font = App.Font.light(size: 22)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private lazy var lastNameLbl : UILabel = {
        let label = UILabel()
        label.font = App.Font.light(size: 22)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private var roleLbl : UILabel = {
        let label = UILabel()
        label.font = App.Font.light(size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    private var pointsLbl : UILabel = {
        let label = UILabel()
        label.font = App.Font.light(size: 16)
        label.textColor = .systemTeal
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    public var photoView : UIImageView = UIImageView()
    
    lazy var container : UIView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setup(){
        photoView.layer.cornerRadius = 20
        photoView.clipsToBounds = true
        photoView.layer.masksToBounds = true
        
        contentView.addSubview(container)
        contentView.backgroundColor = .systemGray6
        container.backgroundColor = .white
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.systemGray5.cgColor
        
        container.addSubview(firstNameLbl)
        container.addSubview(lastNameLbl)
        container.addSubview(roleLbl)
        container.addSubview(pointsLbl)
        container.addSubview(photoView)
        
        container.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(3)
            make.bottom.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(6)
            make.right.equalToSuperview().offset(-6)
        }
        
        photoView.snp.makeConstraints{ make in
            make.left.top.equalToSuperview().offset(22)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        firstNameLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(photoView.snp.right).offset(22)
        }
        lastNameLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(firstNameLbl.snp.right).offset(8)
        }
        roleLbl.snp.makeConstraints { make in
            make.left.equalTo(photoView.snp.right).offset(22)
            make.bottom.equalToSuperview().offset(-14)
        }
        pointsLbl.snp.makeConstraints{ make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(32)
        }
    }
    
    var employees: Employee? {
        didSet{
            if let e = employees {
                firstNameLbl.text = e.firstname
                lastNameLbl.text = e.lastname
                roleLbl.text = e.role
                pointsLbl.text = String(e.points) + " " + "pts"
//                photoView.setImageFromUrl(e.photo)
            }
        }
    }
}
