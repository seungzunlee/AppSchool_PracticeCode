//
//  AddSheetView.swift
//  WebViewDemo
//
//  Created by 안지영 on 2023/08/03.
//

import SwiftUI

struct AddSheetView: View {
    
    var webSiteStore: WebSiteStore
    @State var title: String = ""
    @State var urlString: String = ""
    @Binding var isShowingAddSheet: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("웹사이트 이름")
                    .font(.headline)
                TextField("웹사이트 이름을 입력하세요.", text: $title)
                    .padding()
                    .border(.black, width: 5)
                    .cornerRadius(10)
                
                Text("웹사이트 URL 주소")
                    .font(.headline)
                    .padding(.top, 25)
                TextField("URL 주소를 입력하세요.", text: $urlString)
                    .padding()
                    .border(.black, width: 5)
                    .cornerRadius(10)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingAddSheet = false
                    } label: {
                        Text("닫기")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        webSiteStore.addArray(website: WebSite(name: title, urlString: urlString))
                        isShowingAddSheet = false
                    } label: {
                        Text("추가")
                    }
                    
                }
            }
        }
    }
}

struct AddSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddSheetView(webSiteStore: WebSiteStore(), isShowingAddSheet: .constant(false))
        }
    }
}
