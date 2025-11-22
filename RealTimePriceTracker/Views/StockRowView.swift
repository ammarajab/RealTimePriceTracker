import SwiftUI

struct StockRowView: View {
    let viewModel: StockRowViewModel

    var body: some View {
        HStack {
            Text(viewModel.symbolText)
                .font(.headline)
            Spacer()
            Text(viewModel.priceText)
                .font(.headline)
                .foregroundStyle(viewModel.changeColor)
            Text(viewModel.changeIndicator)
                .font(.caption)
                .foregroundStyle(viewModel.changeColor)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}
