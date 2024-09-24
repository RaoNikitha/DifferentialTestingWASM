;; Construct a WebAssembly module with a sequence where a `br` instruction wrongly aims to escape an enclosing `loop`. Follow it with `unreachable` to check if trapping occurs consistently, ensuring that the error handling differentiates correct labels from incorrect ones.

(assert_invalid
  (module (func $test-loop-escape (loop (br 2) (unreachable)))
  "unknown label"
)