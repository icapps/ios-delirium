//
//  CellDequeue.swift
//  Pods
//
//  Created by Stijn Willems on 10/03/2017.
//
//

import Foundation

/**
The task of these classes is to set the right data on a cell.
The reason this is done in a separate object is to be type safe.
As UIKit is not generic we have to create an intermedite swift object that is.
*/
public class CellDequeue<C: UICollectionViewCell, ID: RawRepresentable> where ID.RawValue == String {

	public typealias CellType = C

	public var cellId: ID

	public init(_ cellId: ID) {
		self.cellId = cellId
	}

	public func setup(_ cell: CellType) {
		print("Should override \(self.setup)")
	}
	
}
