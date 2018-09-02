# Test issue #3: https://github.com/edreamleo/make-stub-files/issues/3

class UnsupportedAlgorithm(Exception):
    def __init__(self, message: Any, reason: Optional[str]=None) -> None:
        pass
