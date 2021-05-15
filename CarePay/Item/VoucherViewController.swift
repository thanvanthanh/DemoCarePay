//
//  VoucherViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/29/21.
//

import UIKit

class VoucherViewController: UIViewController {
    
    let imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "coupon")
        
       return image
    }()
    
    let statusLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bạn chưa có voucher nào"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bạn có thể quản lý tất cả voucher tại đây."
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.91, green: 0.95, blue: 0.78, alpha: 1.00)
        navigationItem.title = "Voucher"
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "return"), style: .done, target: self, action: #selector(backtoHome))
        navigationItem.leftBarButtonItem = signoutButton
        //ẩn thanh Tabbar
//        self.tabBarController?.tabBar.isHidden = true
        setupLayout()
        
        
    }
    func setupLayout(){
        view.addSubview(imageView)
        view.addSubview(statusLabel)
        view.addSubview(titleLabel)
        
        statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -10).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
    }

    @objc func backtoHome(){
        navigationController?.popToRootViewController(animated: true)
    }

}
