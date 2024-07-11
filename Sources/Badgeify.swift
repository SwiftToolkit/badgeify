import AppKit
import ArgumentParser
import Foundation
import PathKit

@main
struct Badgeify: @preconcurrency ParsableCommand {
    @Option(name: .shortAndLong, transform: relativePath(from:))
    var input: Path

    @Option(name: .shortAndLong, transform: relativePath(from:))
    var output: Path

    @Option
    var text: String

    func validate() throws {
        if text.isEmpty {
            throw ValidationError("Text cannot be empty")
        }
    }

    @MainActor mutating func run() throws {
        let imageData = try input.read()
        guard let originalIcon = NSImage(data: imageData) else {
            throw Error.invalidImageData
        }

        let badgedIcon = originalIcon.applyBadge(text: text)
        guard let badgedImageData = badgedIcon?.asPNGData else {
            throw Error.invalidImageData
        }

        try output.write(badgedImageData)

        print("Image successfully badged with \(text)")
    }
}
