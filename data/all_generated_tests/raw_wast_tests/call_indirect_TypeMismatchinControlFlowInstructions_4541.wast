;; 10. **Indirect Call within Loop Exceeding Stack Depth**:     - Description: Implement a deep nested loop structure, where the inner loop calls a function indirectly expecting `i32`, but receives `f64` as the result. The mismatched type combined with stack depth should cause an error.  These tests should effectively check for differential behavior in handling type mismatches in control flow instructions between the WebAssembly and wizard_engine implementations of the `call_indirect` instruction.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (param f64)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func $callee (param f64))
    (func $caller
      (loop $outer
        (loop $inner
          (call_indirect (type 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)