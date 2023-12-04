//
//  ContentView.swift
//  ExpenseMointor Watch App
//
//  Created by Adesh Shah on 2023-12-04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ExpenseViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.expense){ expense in
                    
                    VStack(alignment: .leading){
                        Text("\(expense.title): $\(expense.amount, specifier: "%.2f")")
                        Text("Category: \(expense.category)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                .onDelete(perform: viewModel.removeExpense)
            }
            .navigationTitle("Expenses")
            .toolbar{
                NavigationLink("Add", destination: AddExpenseView(viewModel: viewModel))
            }
        }
    }
}

#Preview {
    ContentView()
}
