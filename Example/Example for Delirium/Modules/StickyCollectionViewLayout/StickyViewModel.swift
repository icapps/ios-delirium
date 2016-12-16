import Foundation

enum Row: Int {
    case row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, row12, row13, row14, row15, row16, row17, row18, row19, row20, row21, row22, row23, row24, row25
}

enum Column: Int {
    case A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, last
}

class ViewModel {
    private var model: [Row: [Column]]

    init() {
        let row1: [Column] = [.A, .B, .C, .D, .E, .F, .G, .H, .last]
        let row2: [Column] = [.I, .J, .K, .L, .M, .N, .O, .P, .last]
        let row3: [Column] = [.Q, .R, .S, .T, .U, .V, .W, .X, .last]
        self.model = [.row1:row1, .row2:row2, .row3:row3, .row4:row1, .row5:row2, .row6:row3, .row7:row1, .row8: row2, .row9: row3, .row10: row1,
                      .row11:row1, .row12:row2, .row13:row3, .row14:row1, .row15:row2, .row16:row3, .row17:row1, .row18: row2, .row19: row3, .row20: row1,
                      .row21:row1, .row22:row2, .row23:row3, .row24:row1, .row25:row2]
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
