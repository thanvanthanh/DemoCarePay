//
//  WalletCollectionViewCell.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/28/21.
//

import UIKit

class WalletCollectionViewCell: UICollectionViewCell {
    
    let iconsWallet : UIImageView = {
        let icons = UIImageView()
        icons.translatesAutoresizingMaskIntoConstraints = false
        icons.image = UIImage(systemName: "qrcode")
        icons.tintColor = UIColor(red: 0.00, green: 0.80, blue: 0.99, alpha: 1.00)
        
        return icons
    }()
    
    let walletLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thanh toán"
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textColor = .black
//        label.shadowColor = .blue
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 12
        return label
    }()
    var wallet: walletData? {
        didSet {
            if let wallet = wallet {
                iconsWallet.image = UIImage(systemName: wallet.icon ?? "")
                walletLabel.text = wallet.type?.rawValue
               
            }
        }
    }
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        setupLayout()
    }
    func setupLayout(){
        self.addSubview(iconsWallet)
        self.addSubview(walletLabel)
        
        iconsWallet.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        iconsWallet.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconsWallet.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        iconsWallet.heightAnchor.constraint(equalTo: iconsWallet.widthAnchor, multiplier: 1).isActive = true
        
        walletLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        walletLabel.topAnchor.constraint(equalTo: iconsWallet.bottomAnchor, constant: 2).isActive = true
//        walletLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
//        walletLabel.heightAnchor.constraint(equalTo: self.heightAnchor, constant: 0.1).isActive = true

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
