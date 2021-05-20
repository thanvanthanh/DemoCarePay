//
//  DealViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/29/21.
//

import UIKit

class DealViewController: UIViewController {
    
    let imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "nothing")
        return image
    }()
    
    let textLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hiện chưa có giao dịch nào"
        label.font = UIFont.systemFont(ofSize: 20)
       return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Lịch sử giao dịch"
        setupLayout()
        
    }
    
    func setupLayout(){
        view.addSubview(imageView)
        view.addSubview(textLabel)
        
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25).isActive = true
        imageView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6).isActive = true
        
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        

        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
