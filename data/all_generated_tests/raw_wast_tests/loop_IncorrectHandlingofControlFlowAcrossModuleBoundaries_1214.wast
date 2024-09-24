;; 5. A nested `loop` structure where an outer loop calls an imported function that contains an inner loop. This test ensures that the transitions between module boundaries maintain proper stack heights and loop contexts.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32) (loop $outer (result i32)
      (call $external_func)
      (loop $inner)
      (br $outer)
    ))
  )
  "type mismatch"
)