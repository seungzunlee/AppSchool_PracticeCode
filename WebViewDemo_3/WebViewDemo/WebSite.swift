//
//  WebSite.swift
//  WebViewDemo
//
//  Created by 안지영 on 2023/08/03.
//

import Foundation


struct WebSite: Identifiable, Codable {
    var id = UUID()
    var name: String
    var urlString: String
    var isFavorite: Bool
}

class WebSiteStore: ObservableObject {
    @Published var webSiteArray: [WebSite] = []
    
    init() {
        webSiteArray = [
            WebSite(name: "구글", urlString: "https://www.google.co.kr", isFavorite: true)
        ]
    }
    
    
    func addArray(website: WebSite) {
        webSiteArray.append(website)
        saveData()
    }
    
    private func saveData() {
        // UserDefaults에 저장하기
        
        let encoder: JSONEncoder = JSONEncoder()
        
        if let encoded = try? encoder.encode(webSiteArray) {
            UserDefaults.standard.set(encoded, forKey: "WebSite")
        }
    }
    
    
    func deleteArray(at offset: IndexSet) {
        webSiteArray.remove(atOffsets: offset)
        saveData()
    }
    
    func favoriteToggle(webSite: WebSite) {
        guard let index = webSiteArray.firstIndex(where: {$0.id == webSite.id}) else { return }
        webSiteArray[index].isFavorite.toggle()
    }
    
    func loadData() {
        // UserDefaults로부터 읽어오기
        if let encoded = UserDefaults.standard.data(forKey: "WebSite") {
            
            let decoder: JSONDecoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([WebSite].self, from: encoded) {
                webSiteArray = decoded
            }
        }
    }
    
    
    
    
}

