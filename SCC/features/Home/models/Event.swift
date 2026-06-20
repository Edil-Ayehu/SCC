//
//  Event.swift
//  SCC
//
//  Created by Edil on 20/06/2026.
//
import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let image: String
}

struct Store: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let image: String
}
