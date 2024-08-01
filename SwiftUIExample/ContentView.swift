//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by seven mr on 2024/7/30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    var body: some View {
        
        NavigationStack{
            VStack{
                NavigationLink(destination: ListOrderView()) {
                        Text("拖动排序")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                }
                
                NavigationLink(destination: ShareExampleView()) {
                        Text("分享图片")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                }
                
                NavigationLink(destination: Shape01View()) {
                        Text("自定义Shape")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                }
                
            }
            .foregroundStyle(.primary)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(.systemGray6))
            
        }
        
    }

}



#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
