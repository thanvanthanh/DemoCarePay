//
//  AccountViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/28/21.
//

import UIKit
    
var dataAC = [accountData]()

class AccountViewController: UIViewController {
    let profileView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.42, green: 0.84, blue: 0.95, alpha: 1.00)
        return view
    }()
    
    let avtProfile : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.layer.borderWidth = 1
        image.image = UIImage(named: "avatar")
        return image
    }()

    let nameProfile : UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = .white
        name.text = "Than Van Thanh"
        name.font = UIFont.systemFont(ofSize: 20)
        return name
    }()
    
    let collectionProfile : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        collectionView.backgroundColor = .none
        collectionView.indicatorStyle = .black
        collectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: "AccountCollectionViewCell")
        
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Tài khoản"
        
        dataAC = creatAccountData()
        
        collectionProfile.dataSource = self
        collectionProfile.delegate = self
        
        setupLayout()
        // Do any additional setup after loading the view.
    }
   
    func setupLayout (){
        
        view.addSubview(profileView)
        profileView.addSubview(avtProfile)
        profileView.addSubview(nameProfile)
        view.addSubview(collectionProfile)
        
        profileView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        profileView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        profileView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        profileView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        avtProfile.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -20).isActive = true
        avtProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        avtProfile.widthAnchor.constraint(equalTo: profileView.widthAnchor, multiplier: 0.2).isActive = true
        avtProfile.heightAnchor.constraint(equalTo: avtProfile.widthAnchor, multiplier: 1).isActive = true
        
        nameProfile.centerYAnchor.constraint(equalTo: avtProfile.centerYAnchor, constant: 0).isActive = true
        nameProfile.leadingAnchor.constraint(equalTo: avtProfile.trailingAnchor, constant: 10).isActive = true
        
        collectionProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collectionProfile.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        collectionProfile.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        collectionProfile.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 0).isActive = true
        
    }
    

}
extension AccountViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height / 12
        return CGSize(width: width, height: height)
    }
    
}
extension AccountViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataAC.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCollectionViewCell", for: indexPath) as! AccountCollectionViewCell
        cell.account = dataAC[indexPath.row]
        return cell
    }
    
    
    
}
extension AccountViewController : UICollectionViewDelegateFlowLayout {
}

