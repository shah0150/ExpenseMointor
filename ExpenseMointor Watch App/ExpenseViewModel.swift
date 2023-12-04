//
//  ExpenseViewModel.swift
//  ExpenseMointor Watch App
//
//  Created by Adesh Shah on 2023-12-04.
//

import Foundation
import SwiftUI

class ExpenseViewModel: ObservableObject {
    @Published var expense: [Expense] = []
    
    func addExpense(title: String, amount: Double, category: String){
        let newExpense = Expense(title: title, amount: amount, category: category)
        expense.append(newExpense)
    }
    
    func removeExpense(at offsets: IndexSet ){
        expense.remove(atOffsets: offsets)
    }
    
    func saveExpense(){
        if let encodeData = try? JSONEncoder().encode(expense){
            UserDefaults.standard.set(encodeData, forKey: "expense")
        }
    }
    
    init(){
        if let expenseData = UserDefaults.standard.data(forKey: "expense"), let decodedData = try? JSONDecoder().decode([Expense].self, from: expenseData){
            expense = decodedData
        }
    }
}
