//
//  RemoteImage.swift
//  SCC
//
//  Created by Edil on 03/07/2026.
//

import SwiftUI

struct RemoteImage: View {

    let url: String?
    var height: CGFloat = 120
    var width: CGFloat? = nil
    var cornerRadius: CGFloat = 18
    var padding: CGFloat = 30

    private var imageURL: URL? {
        guard
            let url,
            !url.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else {
            return nil
        }

        return URL(string: url)
    }

    var body: some View {
        Group {
            if let imageURL {
                AsyncImage(url: imageURL) { phase in
                    switch phase {

                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()

                    case .empty:
                        ProgressView()

                    case .failure(_):
                        placeholder

                    @unknown default:
                        placeholder
                    }
                }
            } else {
                placeholder
            }
        }
        .frame(width: width, height: height)
        .frame(maxWidth: width == nil ? .infinity : nil)
        .background(Color.gray.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    private var placeholder: some View {
        Image(systemName: "photo")
            .resizable()
            .scaledToFill()
            .foregroundColor(.gray.opacity(0.3))
            .padding(padding)
            .background(Color.gray.opacity(0.1))
    }
}

