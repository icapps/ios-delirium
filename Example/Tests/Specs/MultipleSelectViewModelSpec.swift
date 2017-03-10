import Quick
import Nimble

@testable import Delirium

class MultipleSelectViewModelSpec: QuickSpec {

	override func spec() {
		describe("ViewModelBehaviour") {

			context("Info") {

				it("Sort according to funtion") {
					let viewModel = MultipleSelectViewModel([("B", selected: false), ("A", selected: false)])

					expect(viewModel.titles.map {$0.0})  == ["A", "B"]
				}
			}
		}
	}

}
