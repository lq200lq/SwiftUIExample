//
//  ListOrderView.swift
//  SwiftUIExample
//
//  Created by seven mr on 2024/7/30.
//

import SwiftUI

struct ListOrderItem:Identifiable {
    
    let id = UUID()
    var name:String
    
}

struct ListOrderView: View {
    
    @State var data:[ListOrderItem] = [
        ListOrderItem(name: "刘一"),
        ListOrderItem(name: "王二麻"),
        ListOrderItem(name: "张三"),
        ListOrderItem(name: "李四"),
        ListOrderItem(name: "徐五"),
        ListOrderItem(name: "唐六")
    ]
    
    @State var selected:ListOrderItem?
    
    var body: some View {
        ScrollView {
            VStack(spacing:16){
                
                ForEach(data) { item in
                    ListOrderSubView(item:item)
                        .onDrag {
                            self.selected = item
                            return NSItemProvider()
                        }
                        .onDrop(of: [.text], delegate: DropViewDelegate(targetItem: item, data: $data, selected: $selected))
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ListOrderView()
}

struct DropViewDelegate : DropDelegate {
    
    // MARK: 移动的目标位置
    var targetItem:ListOrderItem
    @Binding var data:[ListOrderItem]
    // MARK: 当前选中的项
    @Binding var selected:ListOrderItem?
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func dropEntered(info: DropInfo) {
        if let selected {
            
            let fromIndex = data.firstIndex { $0.id == selected.id }
            if let fromIndex {
                let toIndex = data.firstIndex { $0.id == targetItem.id }
                if let toIndex, toIndex != fromIndex {
                    withAnimation(.linear(duration: 0.2)) {
                        self.data.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: (toIndex > fromIndex) ? (toIndex + 1) : toIndex)
                    }
                }
            }
            
        }
    }
    
    func performDrop(info: DropInfo) -> Bool {
        selected = nil
        return true
    }
    
    
    
    
}

struct ListOrderSubView: View {
    
    var item:ListOrderItem
    
    var body: some View {
        HStack{
            Text(item.name)
        }
        .padding()
        .frame(maxWidth:.infinity)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
