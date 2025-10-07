//
//  HomeTabView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            incomeTabItemView
            settingsTabItemView
        }
    }
}

private extension HomeTabView {
    var incomeTabItemView: some View {
        NavigationStack {
            IncomeView()
        }
        .tabItem {
            Image(systemName: "dollarsign.square")
            Text("Income")
        }
    }
    
    var settingsTabItemView: some View {
        SettingsView ()
            .tabItem {
                Image(systemName: "gearshape")
                Text("Settings")
            }
    }
}

#Preview {
    HomeTabView()
}
