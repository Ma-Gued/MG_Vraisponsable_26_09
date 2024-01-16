//
//  Tab.swift
//  Myapplication
//
//  Created by apprenant65 on 23/09/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case services = "Favorie"
    case favorite = "Notification"
    case settings = "Settings"

var systemImage: String {
    switch self {
    case .home:
        return "map"
    case .services:
        return "heart"
    case .favorite:
        return "lightbulb"
    case .settings:
        return "gearshape"
    }
}

    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}

class TabBarState: ObservableObject {
    @Published var selectedTab: Tab = .home
}
