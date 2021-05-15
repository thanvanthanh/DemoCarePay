//
//  MessengerViewController.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/28/21.
//

import UIKit

class MessengerViewController: UIViewController {
    
    var data = [messData]()
    
    var messTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .none
        tableView.register(MessTableViewCell.self, forCellReuseIdentifier: "MessTableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.82, green: 1.00, blue: 1.00, alpha: 1.00)
        navigationItem.title = "Thông báo"
        data = creatMessData()
        messTableView.tableFooterView = UIView()
        messTableView.dataSource = self
        messTableView.delegate = self
        setupLayout()
    }
    func setupLayout(){
        view.addSubview(messTableView)
        
        
        messTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        messTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        messTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        messTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true

        
        
    }
    
}

extension MessengerViewController : UITableViewDelegate  {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
extension MessengerViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessTableViewCell", for: indexPath) as! MessTableViewCell
        cell.mess = data[indexPath.row]
        return cell
    }
    
    
}
