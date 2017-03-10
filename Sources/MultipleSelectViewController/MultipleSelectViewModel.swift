import Foundation

enum MultipleSelectViewModelError: Error {
	case sectionOutOfBounds(Int)
	case itemOutOfBounds(Int)
	case invalidCellType
}

open class MultipleSelectViewModel {

	public var titles: [MultipleSelectViewController.ChecklistItem]
	public let rowSortFunction: (MultipleSelectViewController.ChecklistItem, MultipleSelectViewController.ChecklistItem) -> Bool

    //swiftlint:disable line_length
    public init(_ titles: [(String, selected: Bool)], rowSortFunction: @escaping ((String, selected: Bool), (String, selected: Bool)) -> Bool = { $0.0 < $1.0}, shouldSortTitles: Bool = true) {
		self.rowSortFunction = rowSortFunction
        self.titles = shouldSortTitles ? titles.sorted(by: rowSortFunction) : titles
	}

	// MARK: - Info
	open func numberOfSections() -> Int {
		return 1
	}

	open func itemsIn(section: Int) throws -> Int {
		guard section < numberOfSections() else {
			throw MultipleSelectViewModelError.sectionOutOfBounds(section)
		}

		return titles.count
	}

	// MARK: - Value at IndexPath
	open func value(at indexPath: IndexPath) throws -> (String, selected: Bool) {
		guard indexPath.section < numberOfSections() else {
			throw MultipleSelectViewModelError.sectionOutOfBounds(indexPath.section)
		}
		guard  indexPath.row < (try itemsIn(section: indexPath.section)) else {
			throw MultipleSelectViewModelError.itemOutOfBounds(indexPath.section)
		}

		return titles[indexPath.row]
	}

}
