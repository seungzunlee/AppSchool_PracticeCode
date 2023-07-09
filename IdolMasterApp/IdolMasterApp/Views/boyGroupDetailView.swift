//
//  DetailView.swift
//  IdolMasterApp
//
//  Created by 신희권 on 2023/07/03.
//

import SwiftUI

struct boyGroupDetailView: View {
    //@State var group: IdolType
    var group: BoyGroup
    
    var body: some View {
        VStack{
            List{
                Section{
                    AsyncImage(url: URL(string: group.image)) { image in
                        
                            image.resizable()
                            .aspectRatio(contentMode: .fit)

                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 300, height: 300, alignment: .center)
                        
                        
                        
                        
                       
                
                } header: {
                    Text("\(group.name)")
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(.black)
                }
                
                Section("member"){
                    ForEach(group.memberName,id: \.self){ member in
                        Text("\(member)")
                    }//List는 위아래 최대 폭 을 잡는다.
                }
                
                Section {
                    Text("소속사 : \(group.company)")
                    Text("멤버 수 : \(group.memberNumbers)")
                    Text("데뷔일 : \(group.debut)")
                 
                    
                } header: {
                    Text("Info")
                        .font(.system(size: 40,weight: .bold))
                        .foregroundColor(.black)
                    
                    
                }

                
            }
        }
    }
}

struct boyGroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        boyGroupDetailView(group: strayKids)
    }
}
