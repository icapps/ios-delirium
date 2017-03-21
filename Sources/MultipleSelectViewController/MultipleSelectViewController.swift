import UIKit

public enum MultipleSelectCellID: String {
	case multipleSelectCell
}
public enum MultipleSelectViewControllerError: Error {
	case invalidCellType
}

open class MultipleSelectViewController: UIViewController {

	public typealias ChecklistItem = (String, selected: Bool)
	public typealias SelectionChangedChecklistItems = ([ChecklistItem]) -> Void
	public typealias SelectionDidChangedChecklistItem = (ChecklistItem) -> Void
 
	public  var viewModel: MultipleSelectViewModel = MultipleSelectViewModel([("Title 1", selected: false), ("Title 2", selected: false)])

	@IBOutlet public weak var collectionView: UICollectionView!

	// MARK: - Changes
	/// Returns all the items in the viewModel with their selected stated every time a cell is changed
	public var selectionDidChangeTo: SelectionChangedChecklistItems?
	/// Returns only the selected item.
	public var selectionDidChangeChecklistItem: SelectionDidChangedChecklistItem?

	// MARK: - Clear Apply
	public var clearAll: (() -> Void)?
	public var applyAll: (() -> Void)?

	// MARK: - Actions
	@IBAction public func clearAll(_ sender: UIButton) {
		if sender.isSelected {
			sender.isSelected = false
			applyAll?()
		} else {
			sender.isSelected = true
			clearAll?()
		}
	}
}

extension MultipleSelectViewController: UICollectionViewDataSource {

	open func numberOfSections(in collectionView: UICollectionView) -> Int {
		return viewModel.numberOfSections()
	}

	open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		do {
			return try viewModel.itemsIn(section: section)
		} catch {
			print(error)
			return 0
		}
	}

	open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell: MultipleCellDequeue.CellType!
		do {
			let dequeue = MultipleCellDequeue(try viewModel.value(at: indexPath))
			cell = try collectionView.dequeue(dequeue.cellId, for: indexPath)
			dequeue.setup(cell)
		} catch {
			print(error)
		}
		return cell
	}
}

extension MultipleSelectViewController: UICollectionViewDelegate {

	open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		do {
			var checklistItem = try viewModel.value(at: indexPath)
			checklistItem.selected = !checklistItem.selected
			viewModel.titles.remove(at: indexPath.row)
			viewModel.titles.insert(checklistItem, at: indexPath.row)
			collectionView.reloadItems(at: [indexPath])
			selectionDidChangeTo?(viewModel.titles)
			selectionDidChangeChecklistItem?(checklistItem)
		} catch {
			print(error)
		}
	}
}

// MARK: - DEQUEUE
extension UICollectionView {

	public func dequeue<C: MultipleCellDequeue.CellType>(_ identifier: MultipleSelectCellID, for indexPath: IndexPath) throws -> C {
		guard let cell = dequeueReusableCell(withReuseIdentifier: identifier.rawValue, for: indexPath) as? C else {
			throw MultipleSelectViewControllerError.invalidCellType
		}
		return cell
	}

}

open class MultipleCellDequeue: CellDequeue<MultipleSelectCollectionViewCell, MultipleSelectCellID> {
	public let titleSelection: MultipleSelectViewController.ChecklistItem

	public init(_ titleSelection: MultipleSelectViewController.ChecklistItem) {
		self.titleSelection = titleSelection
		super.init(.multipleSelectCell)
	}

	override open func setup(_ cell: MultipleSelectCollectionViewCell) {
		cell.label.text = titleSelection.0
		cell.checkMark.checked = titleSelection.selected
	}

}

// MARK: - Cell
public class MultipleSelectCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var checkMark: CheckmarkView!

}
