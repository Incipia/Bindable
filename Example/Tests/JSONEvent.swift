//
//  JSONEvent.swift
//  GigSalad
//
//  Created by Leif Meyer on 2/27/17.
//  Copyright © 2017 Incipia. All rights reserved.
//

import Foundation
import Bindable

class JSONEvent: KVEvent, IncKVJSONInitableRepresentableClass {}

extension KVEventCategory: IncJSONInitable, IncJSONRepresentable {
   init?(json: Any) throws {
      guard let rawValue = json as? String else { throw KVEventCategory.jsonTypeError(value: json) }
      guard let value = KVEventCategory(rawValue: rawValue) else { throw KVEventCategory.jsonValueError(value: json) }
      self = value
   }
   var jsonRepresentation: Any? {
      return rawValue
   }
}

extension KVEventType: IncJSONInitable, IncJSONRepresentable {
   init?(json: Any) throws {
      guard let rawValue = json as? String else { throw KVEventType.jsonTypeError(value: json) }
      guard let value = KVEventType(rawValue: rawValue) else { throw KVEventType.jsonValueError(value: json) }
      self = value
   }
   var jsonRepresentation: Any? {
      return rawValue
   }
}

extension KVEventKey: IncJSONFactory {
   func value(json: Any) throws -> Any? {
      switch self {
      case .category:
         return try KVEventCategory(json: json)
      case .type:
         return try KVEventType(json: json)
      default:
         return json
      }
   }
}
