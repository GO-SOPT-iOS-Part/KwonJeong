//
//  MyPageListModel.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import UIKit

struct MyPageListModel {
    let list: String
}

extension MyPageListModel {
    
    static func firstmyPageListdummyData() -> [MyPageListModel] {
        return [
            MyPageListModel(list: "이용권"),
            MyPageListModel(list: "1:1 문의내역"),
            MyPageListModel(list: "예약알림"),
            MyPageListModel(list: "회원정보 수정"),
            MyPageListModel(list: "프로모션 정보 수신 동의")
                ]
    }
    
    static func secondmyPageListdummyData() -> [MyPageListModel] {
        return [
            MyPageListModel(list: "공지사항"),
            MyPageListModel(list: "이벤트"),
            MyPageListModel(list: "고객센터"),
            MyPageListModel(list: "티빙 알아보기")
                ]
    }
}
