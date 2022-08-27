//
//  DetailedAuthorViewConfigurator.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation

final class DetailedAuthorViewConfigurator {
    
    public static func configureDetailedAuthorView(with user: User) -> DetailedAuthorView {
        let detailedAuthorView = DetailedAuthorView(viewModel: DetailedAuthorViewModel(user: user))
        
        return detailedAuthorView
    }
}
