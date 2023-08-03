//
//  ContentView.swift
//  WebViewDemo
//
//  Created by 안지영 on 2023/08/03.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    
    @ObservedObject var webSiteStore = WebSiteStore()
    
    @State var isShowingWebViewSheet: Bool = false
    @State var isShowingAddSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(webSiteStore.webSiteArray) { webSite in
                    Button {
                        isShowingWebViewSheet = true
                    } label: {
                        Text(webSite.name)
                    }
                    .sheet(isPresented: $isShowingWebViewSheet) {
                        SafariView(urlString: webSite.urlString)
                    }
                }
                .onDelete(perform: webSiteStore.deleteArray)
            }
            .navigationTitle("Web Site")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddSheet = true
                    } label: {
                        Label("추가", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddSheet) {
                AddSheetView(webSiteStore: webSiteStore, isShowingAddSheet: $isShowingAddSheet)
            }
        }
        .onAppear {
            webSiteStore.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
