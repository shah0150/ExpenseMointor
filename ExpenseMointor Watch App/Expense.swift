//
//  Expense.swift
//  ExpenseMointor Watch App
//
//  Created by Adesh Shah on 2023-12-04.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    var title: String
    var amount: Double
    var category: String
}
