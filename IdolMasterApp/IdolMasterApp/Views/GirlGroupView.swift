//
//  GirlGroupView.swift
//  IdolMasterApp
//
//  Created by 신희권 on 2023/07/03.
//

import SwiftUI

struct GirlGroupView: View {
    var body: some View {
        NavigationStack{
            List(girlGroup){ girlGroup in
                NavigationLink{
                    girlGroupDetailView(group: girlGroup)
                } label: {
                    Text("\(girlGroup.name)")
                }
                
            }.navigationTitle("GirlGroup")
        }
    }
}

struct GirlGroupView_Previews: PreviewProvider {
    static var previews: some View {
        GirlGroupView()
    }
}
