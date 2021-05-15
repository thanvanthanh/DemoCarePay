//
//  MessTableViewCell.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/29/21.
//

import UIKit

class MessTableViewCell: UITableViewCell {
    
    let iconsCell : UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "bell")
        return icon
    }()
    
    let titleCell : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Thông báo"
        title.font = UIFont.systemFont(ofSize: 20)
        title.textColor = .black
        return title
    }()
    
    let textCell : UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Thông báo"
        text.font = UIFont.systemFont(ofSize: 15)
        text.adjustsFontSizeToFitWidth = true

        text.textColor = .black
        return text
    }()
    
    let dayCell : UILabel = {
        let day = UILabel()
        day.translatesAutoresizingMaskIntoConstraints = false
        day.text = "2 ngày trước"
        day.font = UIFont.systemFont(ofSize: 13)
        day.textColor = .gray
        return day
    }()
    
    var mess : messData? {
        didSet{
            if let mess = mess{
                iconsCell.image = UIImage(named: mess.icon ?? "")
                titleCell.text = mess.title
                textCell.text = mess.text
                dayCell.text = mess.day

            }            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 1.00, alpha: 1.00)
        setupLayout()
}

    
    
    func setupLayout(){
        
        self.addSubview(iconsCell)
        self.addSubview(titleCell)
        self.addSubview(textCell)
        self.addSubview(dayCell)
        
        iconsCell.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconsCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        iconsCell.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        iconsCell.widthAnchor.constraint(equalTo: iconsCell.heightAnchor, multiplier: 1).isActive = true
        
        titleCell.topAnchor.constraint(equalTo: iconsCell.topAnchor, constant: 0).isActive = true
        titleCell.leadingAnchor.constraint(equalTo: iconsCell.trailingAnchor, constant: 10).isActive = true
        
        textCell.bottomAnchor.constraint(equalTo: iconsCell.bottomAnchor, constant: 0).isActive = true
        textCell.leadingAnchor.constraint(equalTo: titleCell.leadingAnchor, constant: 0).isActive = true
        
        dayCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        dayCell.bottomAnchor.constraint(equalTo: titleCell.bottomAnchor, constant: 0).isActive = true
        
    }

    
}
