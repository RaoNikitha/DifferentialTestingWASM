;; Create a scenario where a `br_if` with a misreferenced out-of-bounds label index is used. Ensure this results in an error, testing both implementations’ label bounds-checking and stack unwinding behavior.

(assert_invalid
  (module
    (func (block (br_if 1 (i32.const 1))))
  )
  "unknown label"
)