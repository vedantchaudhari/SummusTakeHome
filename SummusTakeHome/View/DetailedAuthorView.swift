//
//  DetailedAuthorView.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation
import Combine
import SwiftUI
import MapKit

struct AuthorInfoRow: View {
    let infoTitle: String
    let info: String
    
    var body: some View {
        HStack {
            Text(infoTitle)
                .fontWeight(.semibold)
            Spacer()
            Text(info)
        }
    }
}

struct DetailedAuthorView: View {
    @ObservedObject var viewModel: DetailedAuthorViewModel
    
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 64, height: 64)
        List {
            Section(header: Text("Basic Information")) {
                AuthorInfoRow(infoTitle: "Username:", info: viewModel.user.username)
                AuthorInfoRow(infoTitle: "Full Name:", info: viewModel.user.name)
                AuthorInfoRow(infoTitle: "Email:", info: viewModel.user.email)
                AuthorInfoRow(infoTitle: "Phone:", info: viewModel.user.phone)
                AuthorInfoRow(infoTitle: "Website:", info: viewModel.user.website)
            }
            Section(header: Text("Company Information")) {
                AuthorInfoRow(infoTitle: "Name:", info: viewModel.user.company.name)
                AuthorInfoRow(infoTitle: "Catchphrase:", info: viewModel.user.company.catchPhrase)
                AuthorInfoRow(infoTitle: "Bs:", info: viewModel.user.company.bs)
            }
            Section(header: Text("Location")) {
                Map(
                    coordinateRegion:
                            .constant(
                                MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: Double(viewModel.user.address.geo.lat) ?? 44.455810,
                                        longitude: Double(viewModel.user.address.geo.lng) ?? -73.217970),
                                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                                )
                            )
                )
                .frame(height: 132)
            }
        }
        Text("Photos:")
            .font(.title3)
            .fontWeight(.semibold)
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(viewModel.photos) { photo in
                    AsyncImage(url: URL(string: photo.thumbnailUrl))
                }
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
    }
}
