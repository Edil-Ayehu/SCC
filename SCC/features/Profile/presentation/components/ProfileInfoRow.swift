//
//  ProfileInfoRow.swift
//  SCC
//
//  Created by Edil on 06/07/2026.
//

import SwiftUI

struct ProfileInfoRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack(alignment: .top, spacing: 18) {

            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.primaryPurple)
                .frame(width: 30)

            VStack(alignment: .leading, spacing: 6) {

                Text(title)
                    .font(.custom("Outfit-Regular", size: 14))
                    .foregroundColor(.gray)

                Text(value)
                    .font(.custom("Outfit-Medium", size: 14))
                    .foregroundColor(.black)
            }

            Spacer()
        }
    }
}
