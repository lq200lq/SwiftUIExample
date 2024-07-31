//
//  ShareExampleView.swift
//  SwiftUIExample
//
//  Created by seven mr on 2024/7/31.
//

import SwiftUI

struct ShareExampleView: View {
    
    
    @State var image:UIImage?
    
    @State var saveSuccess = false
    
    var body: some View {
        VStack{
            
            // MARK: 分享的卡片
            shareCard()
            
            // MARK: 按钮
            HStack(spacing:20){
            
                if let image {
                    // MARK: 下载按钮
                    Button(action: {
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        withAnimation {
                            saveSuccess = true
                        }
                    }, label: {
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width:50)
                            .overlay {
                                
                                Image(systemName: saveSuccess ? "checkmark" : "square.and.arrow.down")
                            }
                    })
                    
                    
                    // MARK: 分享按钮
                    ShareLink(item: Image(uiImage: image), preview: SharePreview("图文分享")) {
                        Circle()
                            .fill(.gray.opacity(0.3))
                            .frame(width:50)
                            .overlay {
                                Image(systemName: "square.and.arrow.up")
                            }
                    }
                    
                }
            }
            .frame(height:80)
            .foregroundStyle(.primary)
        }
        .padding()
        .onAppear{
            renderView()
        }
        
        
    }
    
    @MainActor
    func renderView(){
        if let renderImage = ImageRenderer(content: shareCard(scale: 3, fonts:[.system(size: 40)])).uiImage {
            self.image = renderImage
        }
    }
    
    func shareCard(scale:CGFloat = 1.0, fonts:[Font] = [.subheadline]) -> some View{
        VStack{
            VStack{
                Text("人间暖意萦怀")
                Text("处处皆是风景")
                
            }
            .font(fonts[0])
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment:.leading)
            .padding(.bottom)
            
            Image("girl")
                .resizable()
                .scaledToFill()
                .frame(height: 300 * scale)
                .clipped()
        }
        .padding()
        .padding()
        .frame(maxWidth: .infinity * scale, maxHeight: .infinity * scale)
        .background(.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

#Preview {
    ShareExampleView()
}
