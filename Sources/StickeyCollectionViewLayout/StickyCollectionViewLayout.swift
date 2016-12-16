import UIKit

public class StickyCollectionViewLayout: UICollectionViewLayout {

    public var preferredItemSize = CGSize(width: 150, height: 40)

    private var itemAttributes = [[UICollectionViewLayoutAttributes]]()
    private var itemsSize = [[CGSize]]()
    private var contentSize : CGSize?

    override public func prepare() {
        super.prepare()
        guard let collectionView = collectionView,
              let numberOfSections = self.collectionView?.numberOfSections,
              numberOfSections > 0 else {
            return
        }

        guard itemAttributes.count > 0 else  {
            // Calculate everything at startup. This code is only executed once
            calculateAllItemAtrributes()
            return
        }
        stickColumnHeaderAndFirstColumn()
    }

    override public var collectionViewContentSize : CGSize {
        return self.contentSize ?? CGSize.zero
    }
    
    override public func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.itemAttributes[indexPath.section][indexPath.row]
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        for section in self.itemAttributes {
            let filteredArray  = section.filter { rect.intersects($0.frame) }
            attributes.append(contentsOf: filteredArray)
        }

        return attributes
    }

    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    public override func invalidateLayout() {
        itemAttributes.removeAll()
        itemsSize.removeAll()
        contentSize = nil
        super.invalidateLayout()
    }

    // MARK: - Privates

    /// Override this function if you want different itemSize for differen cells.
    /// By default the preferredItemSize is used for everything.
    /// When the itemSizes are calculated the heigth for 1 row will be the maximum height of a cell in that row.
    /// - parameter column: typically this is the row of `indexPath.row`
    /// - parameter row: typically this is the section of `indexPath.row`
    public func sizeForItemWithColumnIndex(_ columnIndex: Int, row: Int) -> CGSize {
        return preferredItemSize
    }
    
    private func calculateItemsSize() {
        guard let collectionView = collectionView else {
            return
        }
        for section in 0..<collectionView.numberOfSections {
            var columnSizes = [CGSize]()
            for index in 0..<collectionView.numberOfItems(inSection: section) {
                columnSizes.append(self.sizeForItemWithColumnIndex(index, row: section))
            }
            self.itemsSize.append(columnSizes)
        }
    }

    private func stickColumnHeaderAndFirstColumn() {
        guard let collectionView = collectionView,
            let numberOfSections = self.collectionView?.numberOfSections,
            numberOfSections > 0 else {
                return
        }

        let contentOffset = collectionView.contentOffset
        for section in 0..<numberOfSections {
            let numberOfItems : Int = collectionView.numberOfItems(inSection: section)
            for index in 0..<numberOfItems {
                if section != 0 && index != 0 {
                    continue
                }

                let attributes = self.layoutAttributesForItem(at: IndexPath(item: index, section: section))!

                // Stick the first row
                if section == 0 {
                    var frame = attributes.frame
                    frame.origin.y = contentOffset.y
                    attributes.frame = frame
                }

                // Stick the first column
                if index == 0 {
                    var frame = attributes.frame
                    frame.origin.x = contentOffset.x
                    attributes.frame = frame
                }
            }
        }
    }

    private func calculateAllItemAtrributes() {

        guard let collectionView = collectionView,
            let numberOfSections = self.collectionView?.numberOfSections,
            numberOfSections > 0 else {
                return
        }

        self.calculateItemsSize()

        var xOffset : CGFloat = 0
        var yOffset : CGFloat = 0
        var contentWidth : CGFloat = 0

        for section in 0..<collectionView.numberOfSections {
            var rowAttributes = [UICollectionViewLayoutAttributes]()
            let numberOfColumns = collectionView.numberOfItems(inSection: section)
            let contentOffset = collectionView.contentOffset

            var maxHeight: CGFloat = 0
            for column in 0..<numberOfColumns {
                let itemSize = self.itemsSize[section][column]

                let indexPath = IndexPath(item: column, section: section)
                let rowAttribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                // Normal frame regardless of stickking.
                // Puts cells next to each other
                rowAttribute.frame = CGRect(x: xOffset, y: yOffset, width: itemSize.width, height: itemSize.height).integral

                // Make headers stick by priority
                // Handle who goes on top if the cells go above eachother
                if section == 0 && column == 0 {
                    rowAttribute.zIndex = 1024 // This is zo the header would stick. This gives a priority to whoever goes on top.
                } else  if section == 0 || column == 0 {
                    rowAttribute.zIndex = 1023
                }

                // Stick the frames to the lefet upper corner
                // Stick the first row
                if section == 0 {
                    var frame = rowAttribute.frame
                    frame.origin.y = contentOffset.y
                    rowAttribute.frame = frame
                }

                // Stick the first column
                if column == 0 {
                    var frame = rowAttribute.frame
                    frame.origin.x = contentOffset.x
                    rowAttribute.frame = frame
                }

                rowAttributes.append(rowAttribute)

                // Move cell to the rigth
                xOffset += (itemSize.width)

                // Store the maxHeight in the row
                if itemSize.height > maxHeight {
                    maxHeight = itemSize.height
                }
                // At the end of the row move to the next row
                // with the largest cell height in that row
                if column == (numberOfColumns - 1) {
                    if xOffset > contentWidth {
                        contentWidth = xOffset
                    }

                    xOffset = 0
                    yOffset += maxHeight
                }
            }

            self.itemAttributes.append(rowAttributes)
        }

        calculateTotalContentSize(contentWidth: contentWidth)
    }

    private func calculateTotalContentSize(contentWidth: CGFloat) {
        guard let lastAttribute = itemAttributes.last?.last else {
            return
        }
        let contentHeight = lastAttribute.frame.origin.y + lastAttribute.frame.size.height
        contentSize = CGSize(width: contentWidth, height: contentHeight)
    }
}
