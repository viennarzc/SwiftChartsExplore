//
//  ContentView.swift
//  ChartsPractice
//
//  Created by Viennarz Curtiz on 6/16/22.
//

import SwiftUI
import Charts

struct Employee: Identifiable {
    let name: String
    let tickets: Int
    
    var id: String { name }
}

let employees: [Employee] = [
    .init(name: "Johs", tickets: 2),
    .init(name: "Stiphs", tickets: 5),
    .init(name: "Nigel", tickets: 8),
    .init(name: "Crews", tickets: 9),
    .init(name: "Lovern", tickets: 1),
    .init(name: "Hedj", tickets: 11),
    .init(name: "George", tickets: 8),
]

struct ContentView: View {
    var body: some View {
        VStack {
            Chart(employees) { item in
                BarMark(
                    x: .value("Tickets", item.tickets),
                    y: .value("Name", item.name))
            }
            
            Chart(employees) { item in
                LineMark(
                    x: .value("Name", item.name),
                    y: .value("Tickets", item.tickets))
            }
            
        }
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
