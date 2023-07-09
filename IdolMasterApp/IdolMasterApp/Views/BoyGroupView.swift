//
//  BoyGroupView.swift
//  IdolMasterApp
//
//  Created by 신희권 on 2023/07/03.
//

import SwiftUI

struct BoyGroupView: View {
    var body: some View {
        NavigationStack{
            List(boyGroup){ group in
                NavigationLink{
                   boyGroupDetailView(group: group)
                } label: {
                    Text("\(group.name)")
                }
                
            }.navigationTitle("BoyGroup")
        }
    }
}

struct BoyGroupView_Previews: PreviewProvider {
    static var previews: some View {
        BoyGroupView()
    }
}
