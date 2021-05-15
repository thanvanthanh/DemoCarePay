//
//  DataService.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/30/21.
//

import Foundation
enum TypeService : String {
    case muasam = "Mua sắm"
    case chuyentien = "Chuyển tiền"
    case napdienthoai = "Nạp điện thoại"
    case thedienthoai = "Thẻ điện thoại"
    case goidata = "Gói Data"
    case hoadon = "Hóa đơn"
    case hoadontaichinh = "Hóa đơn tài chính"
    case vemaybay = "Vé máy bay"
}

struct serviceData {
    var iconService : String?
    var types : TypeService?
}

func creatServiceData() -> [serviceData]{
    let data1 = serviceData(iconService: "muasam", types: .muasam)
    let data2 = serviceData(iconService: "chuyentien", types: .chuyentien)
    let data3 = serviceData(iconService: "napdienthoai", types: .napdienthoai)
    let data4 = serviceData(iconService: "thedienthoai", types: .thedienthoai)
    let data5 = serviceData(iconService: "goidata", types: .goidata)
    let data6 = serviceData(iconService: "hoadon", types: .hoadon)
    let data7 = serviceData(iconService: "hoadontaichinh", types: .hoadontaichinh)
    let data8 = serviceData(iconService: "vemaybay", types: .vemaybay)
    
    return [data1, data2 , data3 , data4 , data5 , data6 , data7 , data8]
    
    
}
