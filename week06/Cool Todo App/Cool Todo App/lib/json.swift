//
//  lib.swift
//  Cool Todo App
//
//  Created by Ruofan Wang on 2024/10/9.
//

import Foundation

func encodeTodoArray(_ array: [todo]) -> String {
    if let data = try? JSONEncoder().encode(array),
        let jsonString = String(data: data, encoding: .utf8)
    {
        return jsonString
    }
    return "[]"
}

func decodeTodoArray(from jsonString: String) -> [todo] {
    if let data = jsonString.data(using: .utf8),
        let decodedArray = try? JSONDecoder().decode([todo].self, from: data)
    {
        return decodedArray
    }
    return []
}

