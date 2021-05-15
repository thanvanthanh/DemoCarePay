//
//  DataMyWallet.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 5/2/21.
//

import Foundation

enum typeMyWallet : String {
    case naptien = "Nạp Tiền"
    case ruttien = "Rút tiền"
    case chuyentien = "Chuyển tiền"
    case lichsu = "Lịch sử"
}
struct myWalletData {
    var icon : String?
    var type : typeMyWallet?
    
}
func creatMyWalletData() -> [myWalletData]{
    let data1 = myWalletData(icon: "dongsign.square", type: .naptien )
    let data2 = myWalletData(icon: "gobackward.minus", type: .ruttien )
    let data3 = myWalletData(icon: "repeat", type: .chuyentien)
    let data4 = myWalletData(icon: "clock", type: .lichsu)

    return [data1, data2 , data3 , data4 ]
}

