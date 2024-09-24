;; 4. Provide a test scenario where the table index supplied to the `call_indirect` instruction is invalid (e.g., out of bounds). Verify that the stack state before the trap is preserved without corruption.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test_func (param i32) (result i32)
      (call_indirect (type 0) (i32.const 2)) ;; The index 2 is out of bounds for the table size 1
    )
  )
  "undefined element"
)