//
//  ContentView.swift
//  SwiftUIPDFView
//
//  Created by Angelos Staboulis on 10/1/24.
//

import SwiftUI
import PDFKit
struct ContentView: View {
    @State var pdffile:String
    @State var isPressed:Bool = false
    var body: some View {
        VStack {
            Color.blue.overlay {
                Text("PDFViewer")
            }.frame(width:UIScreen.main.bounds.width,height:45)
            Color.gray.overlay {
                HStack{
                    VStack{
                        HStack{
                            Text("Enter path of PDF").frame(width:200,height:25,alignment: .leading)
                        }.frame(width:390,height:25,alignment: .leading)
                        HStack{
                            TextField("Enter path of PDF", text: $pdffile)
                                .background(content: {
                                    Color.gray
                                    .frame(width:385,height:40,alignment: .leading)
                                })
                                .foregroundStyle(.white)
                                .colorMultiply(.blue)

                        }.frame(width:385,height:40,alignment: .leading)
                        HStack{
                            Button(action: {
                                isPressed.toggle()
                            }, label: {
                                Text(isPressed ? "Clear View" : "View Load File")
                            })
                        }.frame(width:385,height:40,alignment: .center)
                        .foregroundStyle(.white)
                        .background(content: {
                            Color.blue
                            .frame(width:385,height:40,alignment: .leading)
                        })
                    }
                }
            }.frame(width:600,height:145)
            Spacer()
            if isPressed{
                Color.gray.overlay {
                    PDFViewer(pdffile: $pdffile)
                        .containerShape(.rect)
                }            .ignoresSafeArea()
            }
           
        }
        .padding()
    }
}

#Preview {
    ContentView(pdffile: "", isPressed: false)
}
