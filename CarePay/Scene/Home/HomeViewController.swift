//
//  HomeViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/28/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //    var type : Type!
    
    var datas = [walletData]()
    var dataSv = [serviceData]()
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.image = UIImage(named: "background1")
        
        return image
    }()
    
    let moneyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.shadowColor = .black
        label.textColor = .white
        return label
    }()
    
    lazy var collectionWallet : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(white: 1, alpha: 1)
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.lightText.cgColor
        collectionView.layer.cornerRadius = 5
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WalletCollectionViewCell.self, forCellWithReuseIdentifier: "WalletCollectionViewCell")
        //        layout.scrollDirection = .horizontal
        
        return collectionView
    }()
    
    lazy var collectionService : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = UIColor.lightText.cgColor
        collectionView.layer.cornerRadius = 5
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: "ServiceCollectionViewCell")
        //        layout.scrollDirection = .horizontal
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        moneyLabel.text = (moneyLabel.text ?? "") + "ᵭ"
        
        datas = creatWalletData()
        dataSv = creatServiceData()
        
        setupLayout()
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        tabBarController?.tabBar.barTintColor = .systemBackground
        tabBarController?.tabBar.tintColor = .red
        tabBarController?.tabBar.backgroundImage = UIImage()
        tabBarController?.tabBar.unselectedItemTintColor = .black

        
        collectionWallet.dataSource = self
        collectionWallet.delegate = self
        collectionService.dataSource = self
        collectionService.delegate = self
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    //ẩn navigation  >>>>>
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
//        self.tabBarController?.tabBar.isHidden = false
        
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//        self.tabBarController?.tabBar.isHidden = true
        
        super.viewWillDisappear(animated)
    }
    /// <<<<<<
    
    
    func setupLayout (){
        view.addSubview(backgroundImage)
        view.addSubview(moneyLabel)
        view.addSubview(collectionWallet)
        view.addSubview(collectionService)
        
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        moneyLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50).isActive = true
        moneyLabel.trailingAnchor.constraint(equalTo: collectionWallet.trailingAnchor, constant: 0).isActive = true
        
        collectionWallet.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collectionWallet.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        collectionWallet.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 5).isActive = true
        collectionWallet.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        collectionService.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collectionService.topAnchor.constraint(equalTo: collectionWallet.bottomAnchor, constant: 10).isActive = true
        collectionService.widthAnchor.constraint(equalTo: collectionWallet.widthAnchor, multiplier: 1).isActive = true
        collectionService.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
    }
}
extension HomeViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionWallet{
            let width = collectionView.bounds.width / 5
            let height = collectionView.bounds.height * 0.9
            return CGSize(width: width, height: height)
            
        }
    
        let width = collectionView.bounds.width / 5
        let height = collectionView.bounds.height / 5
        return CGSize(width: width, height: height)
        
    }
    
}
extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionWallet {
            return datas.count

        }
        return dataSv.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if collectionView == self.collectionWallet{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalletCollectionViewCell", for: indexPath) as! WalletCollectionViewCell
            cell.wallet = datas[indexPath.row]
            return cell
        }else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCollectionViewCell", for: indexPath) as! ServiceCollectionViewCell
            cell2.service = dataSv[indexPath.row]
            return cell2
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionWallet {
            switch datas[indexPath.item].type {
            
            case .thanhtoan :
                let vc1 = PayViewController()
                navigationController?.pushViewController(vc1, animated: true)
            case .naptien :
                let vc2 = RechargeViewController()
                navigationController?.pushViewController(vc2, animated: true)
            case .voucher :
                let vc3 = VoucherViewController()
                navigationController?.pushViewController(vc3, animated: true)
            case .vitien :
                let vc4 = WalletViewController()
                navigationController?.pushViewController(vc4, animated: true)
            default:
                break
            }
            
        } else {
            switch dataSv[indexPath.item].types {
            
            case .muasam :
                print("mua sắm")
            
            case .chuyentien :
                print("Chuyển tiền")
                
            case .napdienthoai :
                print("nạp điện thoại")
                
            case .thedienthoai :
                print("thẻ điện thoại")
                
            case .goidata :
                print("gói đata")
                
            case .hoadon :
                print("hóa đơn")
                
            case .hoadontaichinh :
                print("hóa đơn tài chính")
                
            case .vemaybay :
                print("vé máy bay")
                
            default:
                break
            
            }
        }
        
    }
    
    
}




extension HomeViewController : UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        if (collectionView == collectionWallet) {
//            return collectionWallet.bounds.height        }
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if (collectionView == collectionWallet) {
//            return 0        }
//        return 20
//    }
    }
    

