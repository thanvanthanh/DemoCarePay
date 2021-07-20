//
//  ServiceCollectionViewCell.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/30/21.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    let iconService : UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "chuyentien")
        
        return icon
    }()
    
    let nameService : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chuyển tiền"
        label.font = UIFont.systemFont(ofSize: 13)
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 12
        label.numberOfLines = 0
        label.textAlignment = .center
       return label
    }()
    var service : serviceData? {
        didSet{
            if let service = service {
                iconService.image = UIImage(named: service.iconService ?? "")
                nameService.text = service.types?.rawValue
                
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    func setupLayout(){
        self.addSubview(iconService)
        self.addSubview(nameService)
        
        iconService.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        iconService.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        iconService.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        iconService.heightAnchor.constraint(equalTo: iconService.widthAnchor, multiplier: 1).isActive = true

        nameService.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        nameService.topAnchor.constraint(equalTo: iconService.bottomAnchor, constant: 0).isActive = true
        nameService.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
        nameService.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true

        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
