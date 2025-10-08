//
//  View+hideKeyboardOnTap.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/8/25.
//

import SwiftUI

extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            hideKeyboard()
        }
    }
}
