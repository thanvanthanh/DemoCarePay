//
//  AccountCollectionViewCell.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 5/1/21.
//

import UIKit

class AccountCollectionViewCell: UICollectionViewCell {
    let iconsAccount : UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(systemName: "clock")
        icon.tintColor = UIColor(red: 0.00, green: 0.80, blue: 0.99, alpha: 1.00)
        return icon
        
    }()
    let labelAccount : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lịch sử giao dịch"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = .black
//        label.shadowColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    var account : accountData? {
        didSet{
            if let account = account {
                iconsAccount.image = UIImage(systemName: account.icon ?? "")
                labelAccount.text = account.type?.rawValue
                
                
            }
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout (){
        self.addSubview(iconsAccount)
        self.addSubview(labelAccount)
        
        iconsAccount.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconsAccount.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        iconsAccount.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        iconsAccount.widthAnchor.constraint(equalTo: iconsAccount.heightAnchor, constant: 0).isActive = true

        
        labelAccount.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        labelAccount.leadingAnchor.constraint(equalTo: iconsAccount.trailingAnchor, constant: 5).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

