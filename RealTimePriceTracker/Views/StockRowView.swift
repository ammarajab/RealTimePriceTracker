import SwiftUI

struct StockRowView: View {
    let quote: StockQuote

    private var isFlashing: Bool {
        Date().timeIntervalSince(quote.lastUpdated) < 1 && quote.lastMovement != .none
    }

    private var flashColor: Color {
        switch quote.lastMovement {
        case .up:
            return .green.opacity(0.25)
        case .down:
            return .red.opacity(0.25)
        case .none:
            return .clear
        }
    }

    private var changeIndicator: String {
        switch quote.lastMovement {
        case .up:
            return "▲"
        case .down:
            return "▼"
        case .none:
            return "="
        }
    }

    private var changeColor: Color {
        switch quote.lastMovement {
        case .up:
            return .green
        case .down:
            return .red
        case .none:
            return .secondary
        }
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(quote.symbol)
                    .font(.headline)
                Text(quote.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text("$\(quote.price, specifier: "%.2f")")
                    .font(.headline)
                HStack(spacing: 4) {
                    Text(changeIndicator)
                        .font(.caption)
                    Text(quote.lastMovement == .none ? "" : "Updated")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
                .foregroundStyle(changeColor)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(isFlashing ? flashColor : Color.clear)
        .animation(.easeInOut(duration: 0.25), value: isFlashing)
    }
}
