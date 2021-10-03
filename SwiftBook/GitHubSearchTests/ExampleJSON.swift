
extension User {
    static var exampleJSON: String {
        return """
            {
            "login": "apple",
            "id": 10639145
            }
            """
    }
}

extension Repository {
    static var exampleJSON: String {
        return """
            "id": 44838949,
            "name": "swift",
            "full_name": "apply/swift",
            "owner": {
            "login": "apple",
            "id": 10639145
            }
            """
    }
}

extension SearchResponse where Item == Repository {
    static var exampleJSON: String {
        return
            """
            {
                "total_count": 218664,
                "items": [
                {
                "id": 44838949,
                "node_id": "MDEwOlJlcG9zaXRvcnk0NDgzODk0OQ==",
                "name": "swift",
                "full_name": "apple/swift",
                "private": false,
                "owner": {
                "login": "apple",
                "id": 10639145,
                }
                },
                {
                "id": 44838949,
                "node_id": "MDEwOlJlcG9zaXRvcnk0NDgzODk0OQ==",
                "name": "swift",
                "full_name": "apple/swift",
                "private": false,
                "owner": {
                "login": "apple",
                "id": 10639145,
                }
                },
                {
                "id": 44838949,
                "node_id": "MDEwOlJlcG9zaXRvcnk0NDgzODk0OQ==",
                "name": "swift",
                "full_name": "apple/swift",
                "private": false,
                "owner": {
                "login": "apple",
                "id": 10639145,
                }
                }
                ]
            }
        """
    }
}

extension GitHubAPIError {
    static var exampleJSON: String {
        return """
            {
              "message": "Validation Failed",
              "errors": [
                {
                  "resource": "Search",
                  "field": "q",
                  "code": "missing"
                }
              ],
              "documentation_url": "https://docs.github.com/v3/search"
            }
            """
    }
}
