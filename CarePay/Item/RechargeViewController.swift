//
//  RechargeViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/29/21.
//

import UIKit

class RechargeViewController: UIViewController {
    
    let moneyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Số tiền"
        label.textColor = .black
        return label
        
    }()

    let moneyTextField : UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "0"
        text.backgroundColor = .white
        text.font = UIFont.systemFont(ofSize: 30)
        text.textColor = UIColor(red: 0.26, green: 0.58, blue: 0.99, alpha: 1.00)
        text.keyboardType = .numberPad
       return text
    }()
    let changeButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tiếp", for: .normal)
        button.backgroundColor = UIColor(red: 0.26, green: 0.58, blue: 0.99, alpha: 1.00)
        button.layer.cornerRadius = 3
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Nạp tiền qua ngân hàng liên kết"
        
        
        setupLayout()
        
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "chevron.left"), style: .done, target: self, action: #selector(backtoHome))
        navigationItem.leftBarButtonItem = signoutButton
        //ẩn thanh Tabbar
//        self.tabBarController?.tabBar.isHidden = true

    }
    
    func setupLayout(){
        
        view.addSubview(moneyLabel)
        view.addSubview(moneyTextField)
        view.addSubview(changeButton)
        
        
        moneyLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 15).isActive = true
        moneyLabel.leadingAnchor.constraint(equalTo: changeButton.leadingAnchor, constant: 0).isActive = true
        
        moneyTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        moneyTextField.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 10).isActive = true
        moneyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        moneyTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        changeButton.topAnchor.constraint(equalTo: moneyTextField.bottomAnchor, constant: 10).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        changeButton.widthAnchor.constraint(equalTo: moneyTextField.widthAnchor, multiplier: 1).isActive = true
        changeButton.heightAnchor.constraint(equalTo: moneyTextField.heightAnchor, multiplier: 0.5).isActive = true

    }
        
    


    @objc func backtoHome(){
        navigationController?.popViewController(animated: true)
//        navigationController?.pushViewController(WalletViewController(), animated: false)
    }
}
