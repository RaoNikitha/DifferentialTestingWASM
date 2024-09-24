;; - Write a function with multiple parameters and check if the `call` instruction correctly matches types and handles stack operations when invoked with different argument lists, focusing on the order and type correctness.

(assert_invalid
  (module
    (type $sig (func (param i32 f64 i32)))
    (func $f (param i32 f64 i32))
    (func $type-mismatch-params
      (i32.const 0) (f64.const 0.0) (i32.const 1)
      (call $f)
    )
  )
  "type mismatch"
)