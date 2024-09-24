;; 7. Develop a differential test where a `call_indirect` instruction occurs inside a nested control structure (`block` within a `loop`), targeting mismatched return types between the nested blocks and the dynamically invoked function. This verifies cross-level control flow type consistency.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $nested-structures
      (block (result f64)
        (loop (result f64)
          (call_indirect (type 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)