//
//  MemoStore.swift
//  MyMemo
//
//  Created by 안지영 on 2023/08/16.
//

import Foundation
import Firebase
import FirebaseFirestore

class MemoStore: ObservableObject {
    @Published var memoArray: [Memo] = []
    
    func fetchMemo() {
        
        Firestore.firestore().collection("Memo")
            .getDocuments { snapShot, error in
                if let snapShot {
                    var savedMemoArray: [Memo] = []
                    
                    for document in snapShot.documents {
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        let text: String = docData["text"] as? String ?? ""
                        
                        let memo: Memo = Memo(id: id, text: text)
                        savedMemoArray.append(memo)
                    }
                    
                    DispatchQueue.main.async {
                        self.memoArray = savedMemoArray
                    }
                }
            }
    }
    
    func saveMemo() {
        if let encodedMemoArray = try? JSONEncoder().encode(memoArray) {
            
            let resultString = String(data: encodedMemoArray, encoding: .utf8) ?? "none"
            print(resultString)
            
            
            Database.database().reference().child("memo").setValue(resultString)
            
        }
    }
    
    
    func addMemo(text: String) {
        let memo: Memo = Memo(text: text)
        
        Firestore.firestore().collection("Memo")
            .document(memo.id)
            .setData(["text" : memo.text])
        
        memoArray.append(memo)
        
        saveMemo()
    }
    
    /*
     통신상의 시간 지연때문에 잠깐 기다리라는 의미로 await를 써줄 수 있음.
     그러면 함수를 async 처리해줘야하기 때문에 Task 로 감싸준,,거
     없어도 가능함. (위에 함수)
     
     Task {
     do {
     try await Firestore.firestore().collection("Memo")
     .document(memo.id)
     .setData(["text": memo.text])
     
     memoArray.append(memo)
     } catch {
     print("firestore error")
     }
     }
     */
    
    
    func removeMemo(at offsets: IndexSet) {
        
        for offset in offsets {
            let memo = memoArray[offset]
            
            Firestore.firestore().collection("Memo").document(memo.id).delete()
            memoArray.remove(at: offset)
        }
    }
    
    
}
