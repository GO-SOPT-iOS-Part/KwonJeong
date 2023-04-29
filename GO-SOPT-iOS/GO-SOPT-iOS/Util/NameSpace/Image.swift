//
//  Image.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/09.
//

import UIKit

let largeConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular, scale: .default)
let mediumConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .regular, scale: .default)

public enum Image {
    
    // MARK: - Authentication
    
    public static let backButtonIcon = UIImage(named: "btn_before")!
    public static let passwordIcon = UIImage(named: "eye-slash")!
    public static let deleteIcon = UIImage(named: "x-circle")!
    public static let welcomeImage = UIImage(named: "welcome")!
    
    // MARK: - Main
    
    public static let movieImg1 = UIImage(named: "movieImage1")!
    public static let movieImg2 = UIImage(named: "movieImage2")!
    public static let movieImg3 = UIImage(named: "movieImage3")!
    public static let movieImg4 = UIImage(named: "movieImage4")!
    public static let movieImg5 = UIImage(named: "movieImage5")!
    public static let profileButton = UIImage(named: "profileButton")!
    public static let tvingLogo = UIImage(named: "tvingLogo")!
    
    // MARK: - MyPage
    
    public static let RightArrow = UIImage(named: "rightArrow")!
    public static let profileImage = UIImage(named: "profile")!
    public static let logoImg = UIImage(named: "logoImg")!
    
    // MARK: - Asset
    
    public static let setting = UIImage(systemName: "gearshape", withConfiguration: largeConfig)!
    public static let notification = UIImage(systemName: "bell", withConfiguration: largeConfig)!
    public static let myTicket = UIImage(systemName: "ticket", withConfiguration: mediumConfig)!
    public static let cash = UIImage(systemName: "c.circle", withConfiguration: mediumConfig)!
}
