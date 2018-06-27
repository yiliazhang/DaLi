//
//  AccountAPI.swift
//  DaLi
//
//  Created by apple on 2018/6/26.
//  Copyright © 2018年 apple. All rights reserved.
//

import Foundation
import Moya

public let provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])

public let accountProvider = MoyaProvider<Account>(plugins: [NetworkLoggerPlugin(verbose: true)])

public enum Account {
    case downloadMoyaWebContent(String)
}

extension Account: TargetType {
    public var baseURL: URL { return URL(string: "https://raw.githubusercontent.com")! } // swiftlint:disable:this force_unwrapping
    public var path: String {
        switch self {
        case .downloadMoyaWebContent(let contentPath):
            return "/Moya/Moya/master/web/\(contentPath)"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .downloadMoyaWebContent:
            return .get
        }
    }
    public var task: Task {
        switch self {
        case .downloadMoyaWebContent:
            return .downloadDestination(defaultDownloadDestination)
        }
    }
    public var sampleData: Data {
        switch self {
        case .downloadMoyaWebContent:
            return Data()
        }
    }

    public var headers: [String: String]? {
        return nil
    }
}

private let defaultDownloadDestination: DownloadDestination = { temporaryURL, response in
    let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    if !directoryURLs.isEmpty {
        guard let suggestedFilename = response.suggestedFilename else {
            fatalError("@Moya/contributor error!! We didn't anticipate this being nil")
        }
        return (directoryURLs[0].appendingPathComponent(suggestedFilename), [])
    }

    return (temporaryURL, [])
}
