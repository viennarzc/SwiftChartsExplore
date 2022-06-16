//
//  InputChartsView.swift
//  ChartsPractice
//
//  Created by Viennarz Curtiz on 6/16/22.
//

import SwiftUI
import Charts

struct Product: Identifiable {
    enum Category: String, Plottable {
        case handheld = "Handheld"
        case console = "Console"
    }
    
    var id: String { name }
    
    let name: String
    let salesCount: Int
    let year: Int
    let category: Category
}


let data: [Product] = [
    .init(name: "Nintendo 64", salesCount: 42, year: 1998, category: .console),
    .init(name: "Playstation", salesCount: 4, year: 1999, category: .console),
    .init(name: "Dreamcast", salesCount: 15, year: 2000, category: .console),
    .init(name: "Xbox", salesCount: 34, year: 2002, category: .console),
    .init(name: "Gameboy", salesCount: 92, year: 1995, category: .handheld),
    .init(name: "PS Vita", salesCount: 1, year: 2006, category: .handheld),
]

struct InputChartsView: View {
    
    enum Foreground {
        case category
        case name
        
        var title: String {
            switch self {
            case .category: return "Category"
            case .name: return "Name"
            }
        }
        
    }
    
    @State private var pickerValue: Foreground = .category
    
    var body: some View {
        VStack {
            Picker("Select", selection: $pickerValue.animation(.easeInOut), content: {
                Text("Cateogry")
                    .tag(Foreground.category)
                Text("Name")
                    .tag(Foreground.name)
            })
                .pickerStyle(SegmentedPickerStyle())
            Chart(data) { item in
                BarMark(
                    x: .value("Sales", item.salesCount),
                    y: .value("Name", item.name))
                .foregroundStyle(by: .value(pickerValue.title, pickerValue == .category ? item.category.rawValue : item.name ))
                
                
            }
            
            
        }
        .padding(16)
    }
}

struct InputChartsView_Previews: PreviewProvider {
    static var previews: some View {
        InputChartsView()
    }
}
