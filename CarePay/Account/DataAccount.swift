//
//  DataAccount.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 5/1/21.
//

import Foundation

enum typeAC : String {
    case lichsugiaodich = "Lịch sử giao dịch"
    case hoadon = "Hóa đơn"
    case baomattaikhoan = "Bảo mật tài khoản"
    case caidat = "Cài đặt"
    case trungtamtrogiup = "Trung tâm trợ giúp"
}

struct accountData {
    var icon : String?
    var type : typeAC?
    
}
func creatAccountData() ->[accountData]{
    let data1 = accountData(icon: "clock", type: .lichsugiaodich)
    let data2 = accountData(icon: "doc.text", type: .hoadon)
    let data3 = accountData(icon: "lock.shield", type: .baomattaikhoan)
    let data4 = accountData(icon: "wrench", type: .caidat)
    let data5 = accountData(icon: "questionmark.circle", type: .trungtamtrogiup)

    return [data1, data2 , data3 , data4, data5 ]
}
