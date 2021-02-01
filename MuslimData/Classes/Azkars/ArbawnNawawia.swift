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
    public let title: String
    public let reference: String
    public let hadeethWithoutForming: String
    public let referenceWithoutForming: String
    
    /// get columns from db.
    enum Columns {
        static let id = Column("id")
        static let hadeeth = Column("hadeeth")
        static let title = Column("title")
        static let reference = Column("reference")
        static let hadeethWithoutForming = Column("hadeethWithoutForming")
        static let referenceWithoutForming = Column("referenceWithoutForming")

    }

    // MARK: - Constructors

    public init(id: Int, hadeeth: String,title:String,reference:String,hadeethWithoutForming:String,referenceWithoutForming:String) {
        self.id = id
        self.hadeeth = hadeeth
        self.title = title
        self.reference = reference
        self.hadeethWithoutForming=hadeethWithoutForming
        self.referenceWithoutForming=referenceWithoutForming
    }

    public init(row: Row) {
        id = row[Columns.id]
        hadeeth = row[Columns.hadeeth]
        title = row[Columns.title]
        reference = row[Columns.reference]
        hadeethWithoutForming = row[Columns.hadeethWithoutForming]
        referenceWithoutForming = row[Columns.referenceWithoutForming]

    }
}
