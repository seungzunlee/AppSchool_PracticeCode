//
//  SafariView.swift
//  WebViewDemo
//
//  Created by 안지영 on 2023/08/03.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(urlString: "https://www.google.co.kr")
    }
}
