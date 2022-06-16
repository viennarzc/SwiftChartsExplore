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
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                Chart(employees) { item in
                    BarMark(
                        x: .value("Tickets", item.tickets),
                        y: .value("Name", item.name))
                }
                .frame(height: 200)
                
                Chart(employees) { item in
                    
                    LineMark(
                        x: .value("Name", item.name),
                        y: .value("Tickets", item.tickets))
                    .foregroundStyle(.red)
                
                }
                .frame(height: 200)
                
                HStack {
                    Chart(employees) { item in
                        AreaMark(x: .value("Test", item.name), y: .value("Tix", item.tickets))
                        
                    }
                    .chartLegend(.hidden)
                    
                    Chart(employees) { item in
                        
                        PointMark(x: .value("Test", item.name), y: .value("Tix", item.tickets))
                            .foregroundStyle(.pink)
                        
                    }
                    .chartYAxis(.hidden)
                    
                    
                }
                .frame(height: 200)
                
                Chart(employees) { item in
                    RuleMark(xStart: 80, xEnd: 200, y: .value("Tickets", item.tickets))
                        .foregroundStyle(.purple)
                }
                .frame(height: 200)
                
                
                
            }
            
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
