//
//  WeatherFailureDecodable+Json.swift
//  WeadyAppTests
//
//  Created by Alex Lin on 15/1/23.
//

import Foundation
import XCTest

final class WeatherFailureDecodableJsonMock: XCTestCase {
    
    static func make1002ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 1002,
        "message": "API key not provided."
    }
}
""".utf8)
    }
    
    
    static func make1003ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 1003,
        "message": "Parameter q is missing."
    }
}
""".utf8)
    }
    
    static func make1005ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 1005,
        "message": "API request url is invalid"
    }
}
""".utf8)
    }
    
    static func make1006ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 1006,
        "message": "No location found matching parameter 'q'"
    }
}
""".utf8)
    }
    
    static func make2006ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 2006,
        "message": "API key provided is invalid"
    }
}
""".utf8)
    }
    
    static func make2007ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 2007,
        "message": "API key has exceeded calls per month quota."
    }
}
""".utf8)
    }
    
    static func make2008ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 2008,
        "message": "API key has been disabled."
    }
}
""".utf8)
    }
    
    static func make2009ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 2009,
        "message": "API key does not have access to the resource. Please check pricing page for what is allowed in your API subscription plan."
    }
}
""".utf8)
    }
    
    static func make9000ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 1006,
        "message": "Json body passed in bulk request is invalid. Please make sure it is valid json with utf-8 encoding."
    }
}
""".utf8)
    }
    
    static func make9001ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 9001,
        "message": "Json body contains too many locations for bulk request. Please keep it below 50 in a single request."
    }
}
""".utf8)
    }
    
    static func make9999ErrorJsonMock() -> Data {
        return Data("""
{
    "error": {
        "code": 9999,
        "message": "Internal application error.'"
    }
}
""".utf8)
    }
    
}
