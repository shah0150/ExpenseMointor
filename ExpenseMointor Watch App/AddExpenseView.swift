//
//  AddExpenseView.swift
//  ExpenseMointor Watch App
//
//  Created by Adesh Shah on 2023-12-04.
//

import SwiftUI

struct AddExpenseView: View {
    
    @ObservedObject var viewModel: ExpenseViewModel
    @State var title = ""
    @State var amount = 0.0
    @State var selectedCategory = "Groceries"
    
    let categories = ["Groceries", "Food", "Drinks", "Other"]
    
    var body: some View {
        
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Amount", value: $amount, formatter: NumberFormatter())
            }
            
            Section{
                Picker("Category", selection: $selectedCategory){
                    ForEach(categories, id: \.self){
                        Text($0)
                    }
                }
            }
            
            Section{
                Button("Save"){
                    viewModel.addExpense(title: title, amount: amount, category: selectedCategory)
                }
            }
        }.navigationTitle("Add Expense")

        
        
    }
}
