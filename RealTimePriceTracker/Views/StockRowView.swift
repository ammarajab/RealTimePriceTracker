import SwiftUI

struct StockRowView: View {
    let quote: StockQuote

    private var changeIndicator: String {
        switch quote.lastMovement {
        case .up:
            return "▲"
        case .down:
            return "▼"
        case .none:
            return ""
        }
    }

    private var changeColor: Color {
        switch quote.lastMovement {
        case .up:
            return .green
        case .down:
            return .red
        case .none:
            return .primary
        }
    }

    var body: some View {
        HStack {
            Text(quote.symbol)
                .font(.headline)
            Spacer()
            Text("$\(quote.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundStyle(changeColor)
            Text(changeIndicator)
                .font(.caption)
                .foregroundStyle(changeColor)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}
