//
//  DataMess.swift
//  CarePay
//
//  Created by Thân Văn Thanh on 4/30/21.
//

import Foundation
struct messData {
    
    var icon : String?
    var title : String?
    var text : String?
    var day : String?
    
}
func creatMessData () -> [messData]{
    let data1 = messData(icon: "bell-icon", title: "Thông báo", text: "Cập nhật thông tin giao dịch,hoàn tiền.", day: "2 ngày trước")
    let data2 = messData(icon: "gift-icon", title: "Khuyến mãi", text: "Đừng bỏ lỡ siêu hấp dẫn từ CarePay.", day: "29/01/2021")
    let data3 = messData(icon: "megaphone-icon", title: "Tin tức", text: "Cập nhật các tính năng mới của Ví CarePay.", day: "")
    return [data1, data2 , data3 ]
}

