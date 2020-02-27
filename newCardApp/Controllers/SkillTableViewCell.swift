//
//  SkillTableViewCell.swift
//  newCardApp
//
//  Created by Balnur Sakhybekova on 2/21/20.
//  Copyright © 2020 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

    private var nameLbl: UILabel = UILabel()
    private var levelLbl: UILabel = UILabel()
//    private var typeLbl: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setup(){
        
        contentView.addSubview(nameLbl)
        contentView.addSubview(levelLbl)
//        contentView.addSubview(typeLbl)
        nameLbl.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(22)
//            make.bottom.equalToSuperview().offset(12)
        }
        levelLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
            make.centerY.equalToSuperview()
//            make.bottom.equalToSuperview().offset(12)
        }
//        typeLbl.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(22)
//            make.right.equalToSuperview().offset(-22)
//            make.bottom.right.equalToSuperview().offset(22)
//        }
//        nameLbl.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.horizontal)
        
    }
    
    var skills: SkillModel? {
        didSet{
            if let s = skills {
                nameLbl.text = s.name
                levelLbl.text = String(s.level)
//                typeLbl.text = s.type
            }
        }
    }
}
