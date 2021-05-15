//
//  DataWallet.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/28/21.
//

import Foundation

enum Type : String {
    case thanhtoan = "Thanh toán"
    case naptien = "Nạp tiền"
    case voucher = "Voucher"
    case vitien = "Ví tiền"
}
struct walletData {
    var icon : String?
    var type : Type?
    
}
func creatWalletData() -> [walletData]{
    let data1 = walletData(icon: "qrcode", type: .thanhtoan )
    let data2 = walletData(icon: "dongsign.square", type: .naptien )
    let data3 = walletData(icon: "tray.full", type: .voucher)
    let data4 = walletData(icon: "creditcard", type: .vitien)

    return [data1, data2 , data3 , data4 ]
}

