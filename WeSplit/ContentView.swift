//
//  ContentView.swift
//  WeSplit
//
//  Created by sonu kumar on 23/6/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var cost = 0.0
    @State private var person = 2
    @State private var tip = 20
    
    var totalPerPerson :Double {
        let peopleCount = Double(person + 2)
        let tipSelection = Double(tip)
        let tipValue = cost / 100 * tipSelection
        let grandTotal = cost + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
       
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]

    var body: some View {
    NavigationView{
        Form {
            Section {
                TextField("Amount", value: $cost, format: .currency(code: Locale.current.currencyCode ?? "INR"))
                    .keyboardType(.decimalPad)
                Picker("Number of People",selection: $person){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
            
            } header: {
                Text("Total amount")
            }
            .navigationTitle("WeSplit")
            Section{
                Picker("TipPercentage",selection: $tip){
                    ForEach(tipPercentages,id: \.self){
                        Text($0, format: .percent)
                    }
                    
                }
                .pickerStyle(.segmented)
            } header:{
                Text("How much tip do you want to leave?")
            }
            Section{
                Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "INR"))
            } header: {
                Text("Amount per person")
            }
        }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
