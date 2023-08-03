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
    @State var isToggle: Bool = false
    var filteredWebSite: [WebSite] {
        webSiteStore.webSiteArray.filter{ webSite in
            !isToggle || webSite.isFavorite
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Toggle(isOn: $isToggle) {
                        Text("FEVORITE")
                    }
                }
                ForEach(filteredWebSite) { webSite in
                    HStack {
                        Button {
                            isShowingWebViewSheet = true
                        } label: {
                            Text(webSite.name)
                        }
                        .sheet(isPresented: $isShowingWebViewSheet) {
                            SafariView(urlString: webSite.urlString)
                        }
                        
                        Spacer()
                        
                        Button {
                            webSiteStore.favoriteToggle(webSite: webSite)
                        } label: {
                            Image(systemName: webSite.isFavorite ? "star.fill" : "star")
                                .renderingMode(.original)
                        }
                        .buttonStyle(.plain)
                        
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
