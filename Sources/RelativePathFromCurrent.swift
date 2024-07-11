import PathKit

func relativePath(from string: String) throws -> Path {
    Path.current + string
}
