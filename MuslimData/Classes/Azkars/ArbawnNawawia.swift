//
//  ArbawnNawawia.swift
//  MuslimData
//
//  Created by Salah on 12/31/20.
//

import Foundation
import GRDB

/// Azkar category model
public struct ArbawnNawawia: FetchableRecord {
    // MARK: - Properties

    public let id: Int
    public let hadeeth: String

    /// get columns from db.
    enum Columns {
        static let id = Column("id")
        static let hadeeth = Column("hadeeth")
    }

    // MARK: - Constructors

    public init(id: Int, hadeeth: String) {
        self.id = id
        self.hadeeth = hadeeth
    }

    public init(row: Row) {
        id = row[Columns.id]
        hadeeth = row[Columns.hadeeth]
    }
}
