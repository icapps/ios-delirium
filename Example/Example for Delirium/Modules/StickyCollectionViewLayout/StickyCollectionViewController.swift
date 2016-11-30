import Foundation
import UIKit
import Delirium

enum StickyCellIdentifier: String {
    case stickyCell
}

enum Row: Int {
    case row1, row2, row3, row4
}

enum Column: Int {
    case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, last
}

class ViewModel {
    private var model: [Row: [Column]]

    init(_ model: [Row: [Column]]) {
        self.model = model
    }

    var numberOfSection: Int {
        return model.count
    }

    func rows(in row: Row) -> Int {
        guard let rows = model[row] else {
            return 0
        }
        return rows.count
    }

    func row(in row: Row) -> [Column] {
        return model[row] ?? [Column]()
    }

}

class StickyCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel: ViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let row1: [Column] = [.A, .B, .C, .D, .E, .F, .G, .H, .last]
        let row2: [Column] = [.I, .J, .K, .L, .M, .N, .O, .P, .last]
        let row3: [Column] = [.Q, .R, .S, .T, .U, .V, .W, .X, .last]
        viewModel = ViewModel([.row1:row1, .row2:row2, .row3:row3])
    }
}

extension StickyCollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSection
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Row(rawValue: section) else {
            return 0
        }

        return viewModel.rows(in: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: .stickyCell, for: indexPath) as! StickyCell

        let row = Row(rawValue: indexPath.section)!
        let column = viewModel.row(in: row)[indexPath.row]
        cell.label.text = "\(row): \(column)"

        if indexPath.row  == 0 {
            cell.backgroundColor = UIColor.darkGray
            cell.label.textColor = UIColor.white

        } else if indexPath.section == 0 {
            cell.backgroundColor = UIColor.gray
            cell.label.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.white
            cell.label.textColor = UIColor.gray
        }

        return cell
    }

}

extension StickyCollectionViewController: UICollectionViewDelegate {


}

extension UICollectionView {

    func dequeueReusableCell(withReuseIdentifier identifier: StickyCellIdentifier, for indexPath: IndexPath) -> UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: identifier.rawValue, for: indexPath)
    }
}
