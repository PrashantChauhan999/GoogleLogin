//
//  Constants.swift
//  demoProject
//
//  Created by prashant on 09/05/22.
//

import Foundation
import UIKit

enum AppFonts: String {
    case nunitoBold = "Nunito-Bold"
    case nunitoSemiBold = "Nunito-SemiBold"

    func withSize(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }

    func withDefaultSize() -> UIFont {
        return UIFont(name: rawValue, size: 12.0) ?? UIFont.systemFont(ofSize: 12.0)
    }
}

enum AppColors: String {
    case backgroundLight = "FFF4F3"
    case backlgroundDark = "F1C3BA"
    case textForground = "5C4B75"
    case textForgroundzLight = "7D84C0"
    case textDarkForground = "5B482C"
    case calendarCurrentMonthDateForground = "AF7B71"
    case textGrey = "ACACAC"
    case textDarkGrey = "707070"
    case textYellowForground = "F6CB83"
    case textSeparatorGrey = "CCCCCC"
    case microbiomeDotColor = "FFC95C"
    case microbiomeLineColor = "F2F3F4"
    case appGreenColor = "90CFB3"
    case acceptColor = "D4D4D4"
    case historySearch = "95746E"
    case graphSeparator = "D9D9D9"
    case graphLabel = "666666"
    case progressSeparator = "FDECE9"
    case fatIntakeProgress = "EAEAEA"
    case greyTextColor = "B4B4B4"
    case tabBarColor = "FFFCFC"
    case placeholderColor = "5C4C74"
    
    func color() -> UIColor {
        return UIColor(hexCode: rawValue)
    }
}

struct Constants {
    
    static let TermsConditionsURLString = "https://www.google.com"
    static let PrivacyPolicyURLString = "https://www.google.com"
    static let HTTP_TEXT = "http://"
    static let BASE_URL = Constants.apiBaseURL()
    static let aboutSampleKit =
"""
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.

"""
    
    static let contactUs =
    """
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.
"""
    
    static func apiBaseURL() -> String {
        return AppConfiguration.shared.activeConfiguration.apiEndPoint
    }
}



