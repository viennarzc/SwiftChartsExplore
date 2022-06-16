//
//  TabbedView.swift
//  ChartsPractice
//
//  Created by Viennarz Curtiz on 6/16/22.
//

import SwiftUI

struct TabbedView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Charts", systemImage: "chart.bar.xaxis")
                }
            InputChartsView()
                .tabItem {
                    Label("Inputs", systemImage: "list.dash.header.rectangle")
                }
        }
    }
}

struct TabbedView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
