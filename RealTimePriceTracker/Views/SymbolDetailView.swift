import SwiftUI

struct SymbolDetailView: View {
    let quote: StockQuote

    private var priceColor: Color {
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
        VStack(alignment: .leading, spacing: 16) {
            Text(quote.symbol)
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack(spacing: 8) {
                Text("$\(quote.price, specifier: "%.2f")")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(priceColor)
                Text(indicator)
                    .font(.title2)
                    .foregroundStyle(priceColor)
            }
            Text(quote.description)
                .font(.body)
            Spacer()
        }
        .padding()
        .navigationTitle("Symbol Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var indicator: String {
        switch quote.lastMovement {
        case .up:
            return "▲"
        case .down:
            return "▼"
        case .none:
            return ""
        }
    }
}
