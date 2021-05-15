//
//  PayViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/29/21.
//

import UIKit

class PayViewController: UIViewController {
    let titleLabel : UILabel = {
        let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Đưa mã này cho thu ngân để thanh toán"
        label.textColor = .lightText
//        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
     
    let viewPay : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.backgroundColor = .white
        
        return view
    }()
    let imageBarcode : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "barcode")
        
        return image
    }()
    let imageQr : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "myqr")
        
        return image
    }()
    
    let textLabel : UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Chi tiêu an toàn hơn với CarePay"
        text.textColor = .white
       return text
    }()
    
    let voucherView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
       return view
    }()
    let iconCoupon : UIImageView = {
       let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "voucherpay")
        icon.tintColor = .orange
        
        return icon
    }()
    
    let titleCoupon : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Coupon"
        label.textColor = .black
        
       return label
    }()
    
    let buttonCoupon : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.34, green: 0.78, blue: 0.75, alpha: 1.00)
        navigationItem.title = "Thanh toán"
        
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "return"), style: .done, target: self, action: #selector(backtoHome))
        navigationItem.leftBarButtonItem = signoutButton
        // ẩn thanh Tabbar
//        self.tabBarController?.tabBar.isHidden = true

        setupLayout()
    }
    
    func setupLayout(){
        view.addSubview(titleLabel)
        view.addSubview(viewPay)
        viewPay.addSubview(imageQr)
        viewPay.addSubview(imageBarcode)
        viewPay.addSubview(voucherView)
        voucherView.addSubview(iconCoupon)
        voucherView.addSubview(titleCoupon)
        voucherView.addSubview(buttonCoupon)
        view.addSubview(textLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10).isActive = true
        
        viewPay.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        viewPay.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        viewPay.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        viewPay.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        
        imageQr.centerXAnchor.constraint(equalTo: viewPay.centerXAnchor, constant: 0).isActive = true
        imageQr.centerYAnchor.constraint(equalTo: viewPay.centerYAnchor, constant: 0).isActive = true
        imageQr.widthAnchor.constraint(equalTo: viewPay.widthAnchor, multiplier: 0.6).isActive = true
        imageQr.heightAnchor.constraint(equalTo: imageQr.widthAnchor, multiplier: 1.2).isActive = true
        
        imageBarcode.centerXAnchor.constraint(equalTo: viewPay.centerXAnchor, constant: 0).isActive = true
        imageBarcode.bottomAnchor.constraint(equalTo: imageQr.topAnchor, constant: -20).isActive = true
        imageBarcode.widthAnchor.constraint(equalTo: viewPay.widthAnchor, multiplier: 0.9).isActive = true
        imageBarcode.heightAnchor.constraint(equalTo: viewPay.heightAnchor, multiplier: 0.15).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: viewPay.bottomAnchor, constant: 10).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        voucherView.centerXAnchor.constraint(equalTo: viewPay.centerXAnchor, constant: 0).isActive = true
        voucherView.widthAnchor.constraint(equalTo: viewPay.widthAnchor, multiplier: 1).isActive = true
        voucherView.heightAnchor.constraint(equalTo: viewPay.heightAnchor, multiplier: 0.1).isActive = true
        voucherView.bottomAnchor.constraint(equalTo: viewPay.bottomAnchor, constant: 0).isActive = true
        
        iconCoupon.centerYAnchor.constraint(equalTo: voucherView.centerYAnchor, constant: 0).isActive = true
        iconCoupon.leadingAnchor.constraint(equalTo: voucherView.leadingAnchor, constant: 5).isActive = true
        iconCoupon.heightAnchor.constraint(equalTo: voucherView.heightAnchor, multiplier: 0.33).isActive = true
        iconCoupon.widthAnchor.constraint(equalTo: iconCoupon.heightAnchor, multiplier: 1.2).isActive = true
        
        titleCoupon.centerYAnchor.constraint(equalTo: voucherView.centerYAnchor, constant: 0).isActive = true
        titleCoupon.leadingAnchor.constraint(equalTo: iconCoupon.trailingAnchor, constant: 5).isActive = true
        
        buttonCoupon.centerYAnchor.constraint(equalTo: voucherView.centerYAnchor, constant: 0).isActive = true
        buttonCoupon.trailingAnchor.constraint(equalTo: voucherView.trailingAnchor, constant: -10).isActive = true
        
    }

    @objc func backtoHome(){
        navigationController?.popToRootViewController(animated: true)
    }
}
