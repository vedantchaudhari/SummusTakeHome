//
//  AuthorRouter.swift
//  SummusTakeHome
//
//  Created by Vedant Chaudhari on 8/26/22.
//

import Foundation
import SwiftUI

final class AuthorRouter {
    
    public static func destinationForTappedAuthor(user: User) -> some View {
        return DetailedAuthorViewConfigurator.configureDetailedAuthorView(with: user)
    }
}
