//
//  Constants.swift
//  PlayMaker
//
//  Created by Артем Фролов on 24.05.2021.
//

import Foundation

typealias VoidCompletion = (() -> Void)
typealias NewsCompletion = (Result<[News], Error>) -> ()
typealias ResultCompletion = (Result<Data, Error>) -> ()

let baseNewsURL = "http://api.mediastack.com/v1/news?access_key="
let accessKey = "780806bad258a48c2086c56339c09461"
