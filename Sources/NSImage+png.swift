import AppKit

extension NSImage {
    var asPNGData: Data? {
        guard let imageData = tiffRepresentation,
              let newRep = NSBitmapImageRep(data: imageData) else {
            return nil
        }

        return newRep.representation(using: .png, properties: [:])
    }
}
