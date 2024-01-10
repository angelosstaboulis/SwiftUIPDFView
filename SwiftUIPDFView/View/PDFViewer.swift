//
//  PDFViewer.swift
//  SwiftUIPDFView
//
//  Created by Angelos Staboulis on 10/1/24.
//
import SwiftUI
import Foundation
import PDFKit
struct PDFViewer:UIViewRepresentable{
    let pdfView = PDFView()
    @Binding var pdffile:String
    
    func makeUIView(context: Context) -> PDFView {
        return pdfView
    }
    func updateUIView(_ uiView: PDFView, context: Context) {
        DispatchQueue.main.async{
            pdfView.document = PDFDocument(url: URL(filePath: pdffile))
            pdfView.displaysAsBook = true
        }
    }
}
