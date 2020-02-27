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
        
        contentView.addSubview(nameLbl)
        contentView.addSubview(levelLbl)
        nameLbl.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(22)
        }
        levelLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
            make.centerY.equalToSuperview()
        }

        
    }
    
    var skills: SkillModel? {
        didSet{
            if let s = skills {
                nameLbl.text = s.name
                levelLbl.text = String(s.level) + " " + "lvl"
            }
        }
    }
}
