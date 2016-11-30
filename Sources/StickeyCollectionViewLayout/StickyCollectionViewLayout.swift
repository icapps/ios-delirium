import UIKit

public class StickyCollectionViewLayout: UICollectionViewLayout {

    var itemAttributes = [[UICollectionViewLayoutAttributes]]()
    var itemsSize = [CGSize]()
    var contentSize : CGSize!
    
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
        return self.contentSize
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
    

    // MARK: - Privates

    private func sizeForItemWithColumnIndex(_ columnIndex: Int) -> CGSize {
        return CGSize(width: 150, height: 40)
    }
    
    private func calculateItemsSize() {
        guard let collectionView = collectionView else {
            return
        }
        for section in 0..<collectionView.numberOfSections {
            for index in 0..<collectionView.numberOfItems(inSection: section) {
                self.itemsSize.append(self.sizeForItemWithColumnIndex(index))
            }
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

        var column = 0
        var xOffset : CGFloat = 0
        var yOffset : CGFloat = 0
        var contentWidth : CGFloat = 0
        var contentHeight : CGFloat = 0

        for section in 0..<self.collectionView!.numberOfSections {
            var rowAttributes = [UICollectionViewLayoutAttributes]()
            let numberOfColumns = collectionView.numberOfItems(inSection: section)
            let contentOffset = collectionView.contentOffset

            for index in 0..<numberOfColumns {
                let itemSize = (self.itemsSize[index] as AnyObject).cgSizeValue
                let indexPath = IndexPath(item: index, section: section)
                let rowAttribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                rowAttribute.frame = CGRect(x: xOffset, y: yOffset, width: (itemSize?.width)!, height: (itemSize?.height)!).integral

                if section == 0 && index == 0 {
                    rowAttribute.zIndex = 1024;
                } else  if section == 0 || index == 0 {
                    rowAttribute.zIndex = 1023
                }

                // Stick the first row
                if section == 0 {
                    var frame = rowAttribute.frame
                    frame.origin.y = contentOffset.y
                    rowAttribute.frame = frame
                }

                // Stick the first column

                if index == 0 {
                    var frame = rowAttribute.frame
                    frame.origin.x = contentOffset.x
                    rowAttribute.frame = frame
                }

                rowAttributes.append(rowAttribute)

                xOffset += (itemSize?.width)!
                column += 1

                if column == numberOfColumns {
                    if xOffset > contentWidth {
                        contentWidth = xOffset
                    }

                    column = 0
                    xOffset = 0
                    yOffset += (itemSize?.height)!
                }
            }

            self.itemAttributes.append(rowAttributes)
        }

        guard let lastAttribute = itemAttributes.last?.last else {
            return
        }
        contentHeight = lastAttribute.frame.origin.y + lastAttribute.frame.size.height
        self.contentSize = CGSize(width: contentWidth, height: contentHeight)
    }
}
