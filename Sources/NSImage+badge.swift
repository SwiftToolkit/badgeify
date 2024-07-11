import AppKit
import SwiftUI

private let iconSize: CGFloat = 1024

extension NSImage {
    @MainActor func applyBadge(text: String) -> NSImage? {
        let icon = Icon(image: self, badgeText: text)
            .frame(width: iconSize, height: iconSize)
        let renderer = ImageRenderer(content: icon)

        return renderer.nsImage
    }
}

struct Icon: View {
    let image: NSImage
    let badgeText: String

    var body: some View {
        ZStack {
            Image(nsImage: image)

            VStack {
                Spacer()

                Text(badgeText)
                    .font(.system(size: 140, weight: .medium, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding([.top, .bottom], 100)
                    .background(Color.yellow.opacity(0.7))
            }
        }
        .background(Color.white)
    }
}
