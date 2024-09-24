;; - Test 2: Execute a `br_table` with a negative index, which should be invalid. This test checks if there is robust error handling implemented to catch and manage negative indices.

(assert_invalid
  (module
    (func (block $label0 (br $label0)))
  )
  "invalid label"
)