//
//  WalletViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/29/21.
//

import UIKit

class WalletViewController: UIViewController {
    var dataMyWallet = [myWalletData]()
    let viewWallet : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.00, green: 0.80, blue: 0.99, alpha: 1.00)
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
        
        return view
    }()
    let myWalletLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Số dư ví"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        
       return label
    }()
    let moneyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
       return label
    }()
    lazy var viewService : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(red: 0.00, green: 0.80, blue: 0.99, alpha: 1.00)
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.lightText.cgColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MyWalletCollectionViewCell.self, forCellWithReuseIdentifier: "MyWalletCollectionViewCell")
        return collectionView
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(red: 0.00, green: 0.80, blue: 0.99, alpha: 1.00)
        button.setTitle("Thêm liên kết", for: .normal)
        button.setTitleColor(UIColor(red: 0.00, green: 0.80, blue: 0.99, alpha: 1.00), for: .normal)
        button.backgroundColor = UIColor(red: 0.80, green: 1.00, blue: 1.00, alpha: 1.00)
        button.layer.cornerRadius = 2
       return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Ví của tôi"
        let signoutButton = UIBarButtonItem(image: UIImage.init(systemName: "return"), style: .done, target: self, action: #selector(backtoHome))
        navigationItem.leftBarButtonItem = signoutButton
        
        viewService.dataSource  = self
        viewService.delegate = self
        
        dataMyWallet = creatMyWalletData()
        setupLayout()
            

    }
    func setupLayout (){
        view.addSubview(viewWallet)
        viewWallet.addSubview(myWalletLabel)
        viewWallet.addSubview(moneyLabel)
        view.addSubview(viewService)
        view.addSubview(addButton)
        viewWallet.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        viewWallet.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        viewWallet.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        viewWallet.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        moneyLabel.centerXAnchor.constraint(equalTo: viewWallet.centerXAnchor, constant: 0).isActive = true
        moneyLabel.centerYAnchor.constraint(equalTo: viewWallet.centerYAnchor, constant: 0).isActive = true
        
        myWalletLabel.bottomAnchor.constraint(equalTo: moneyLabel.topAnchor, constant: -10).isActive = true
        myWalletLabel.centerXAnchor.constraint(equalTo: viewWallet.centerXAnchor, constant: 0).isActive = true
        
        viewService.topAnchor.constraint(equalTo: viewWallet.bottomAnchor, constant: 0).isActive = true
        viewService.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        viewService.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        viewService.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        addButton.topAnchor.constraint(equalTo: viewService.bottomAnchor, constant: 10).isActive = true
        addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95).isActive = true
        addButton.heightAnchor.constraint(equalTo: viewService.heightAnchor, multiplier: 1).isActive = true
    }
    @objc func backtoHome(){
        navigationController?.popToRootViewController(animated: true)
    }
}
extension WalletViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 5
        let height = collectionView.bounds.height * 0.9
        return CGSize(width: width, height: height)
        
    }
}
extension WalletViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataMyWallet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyWalletCollectionViewCell", for: indexPath) as! MyWalletCollectionViewCell
        cell.myWallet = dataMyWallet[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch dataMyWallet[indexPath.item].type {

        case .naptien :
            let vc1 = RechargeViewController()
            navigationController?.pushViewController(vc1, animated: true)
        case .ruttien:
            let vc2 = WithdrawCashViewController()
            navigationController?.pushViewController(vc2, animated: true)
        case .chuyentien:
            print("chuyển tiền")
        case .lichsu:
            let vc4 = DealViewController()
            navigationController?.pushViewController(vc4, animated: true)
            navigationItem.backButtonTitle = ""
        default:
            break
        }

    }
    
    
}
extension WalletViewController : UICollectionViewDelegateFlowLayout{
    
}
