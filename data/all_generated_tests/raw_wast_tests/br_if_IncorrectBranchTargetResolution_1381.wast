;; 2. Create a `br_if` within a `loop` with an incorrect label index that exceeds the number of available labels. This checks if the implementation correctly handles stack underflow and provides an appropriate error for invalid label references.

(assert_invalid
  (module (func $incorrect-label-index (loop (br_if 2 (i32.const 1)))))
  "unknown label"
)