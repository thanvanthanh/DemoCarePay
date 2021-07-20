//
//  MyWalletCollectionViewCell.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 5/2/21.
//

import UIKit

class MyWalletCollectionViewCell: UICollectionViewCell {
    
    let iconsMyWallet : UIImageView = {
        let icons = UIImageView()
        icons.translatesAutoresizingMaskIntoConstraints = false
        icons.image = UIImage(systemName: "dongsign.square")
        icons.tintColor = .white
        
        return icons
    }()
    
    let myWalletLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nạp tiền"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = .white
//        label.shadowColor = .blue
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 12
        return label
    }()
    var myWallet : myWalletData? {
        didSet{
            if let myWallet = myWallet{
                iconsMyWallet.image = UIImage(systemName: myWallet.icon ?? "")
                myWalletLabel.text = myWallet.type?.rawValue
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    func setupLayout(){
        self.addSubview(iconsMyWallet)
        self.addSubview(myWalletLabel)
        
        iconsMyWallet.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        iconsMyWallet.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        iconsMyWallet.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        iconsMyWallet.heightAnchor.constraint(equalTo: iconsMyWallet.widthAnchor, multiplier: 1).isActive = true
        
        myWalletLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        myWalletLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

