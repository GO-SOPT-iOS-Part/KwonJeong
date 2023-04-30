//
//  MyPageScrollView.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/28.
//

import UIKit

import SnapKit
import Then

final class MyPageView: UIScrollView {
    
    // MARK: - UI Components
    
    private let myPageStackView = UIStackView()
    private let myProfileView = MyProfileView()
    private let myTicketView = MyTicketView()
    private let buyTicketView = BuyTicketView()
    private let myPageTableView = UITableView(frame: .zero, style: .grouped)
    private let firstDummy = MyPageListModel.firstmyPageListdummyData()
    private let secondDummy = MyPageListModel.secondmyPageListdummyData()
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setDelegate()
        setNavigationBarColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyPageView {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        backgroundColor = Color.tvingBlack
        
        myPageStackView.do {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 12
        }
        
        myTicketView.do {
            $0.layer.cornerRadius = 5
        }
        
        buyTicketView.do {
            $0.layer.cornerRadius = 5
        }
        
        myPageTableView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
//            $0.isScrollEnabled = false
            $0.showsVerticalScrollIndicator = false
            $0.backgroundColor = Color.tvingBlack
            $0.isScrollEnabled = false
//            $0.rowHeight = UITableView.automaticDimension
//            $0.bounces = false
//            $0.contentInsetAdjustmentBehavior = .never
//            $0.sectionFooterHeight = .leastNormalMagnitude
            $0.registerCell(MyPageTableViewCell.self)
            $0.registerReusableView(SectionLineView.self)
            $0.registerReusableView(LogoutButtonView.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        myPageStackView.addArrangedSubviews(myProfileView, myTicketView, buyTicketView)
        addSubviews(myPageStackView, myPageTableView)
        
        myPageStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(3)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(284)
        }
        
        myProfileView.snp.makeConstraints {
            $0.height.equalTo(108)
        }
        
        myTicketView.snp.makeConstraints {
            $0.height.equalTo(92)
        }
        
        buyTicketView.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        
        myPageTableView.snp.makeConstraints {
            $0.top.equalTo(myPageStackView.snp.bottom).offset(24)
            $0.leading.trailing.equalTo(safeAreaLayoutGuide)
            $0.bottom.equalToSuperview().inset(50)
            $0.height.equalTo(617)
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
    }
    
    private func setNavigationBarColor() {
        
        if #available(iOS 15, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            navigationBarAppearance.backgroundColor = .clear
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
    
    // MARK: - @objc Methods
}

extension MyPageView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return 5
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lineView = myPageTableView.dequeueReusableView(type: SectionLineView.self)
        return lineView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch (section) {
        case 1:
            return 32
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let logoutButton = myPageTableView.dequeueReusableView(type: LogoutButtonView.self)
        return logoutButton
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch (section) {
        case 1:
            return 100
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section) {
        case 0:
            let cell = myPageTableView.dequeueCell(type: MyPageTableViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: firstDummy[indexPath.item])
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = myPageTableView.dequeueCell(type: MyPageTableViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: secondDummy[indexPath.item])
            cell.selectionStyle = .none
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
}

extension MyPageView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
}
