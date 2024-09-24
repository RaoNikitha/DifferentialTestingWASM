;; 8. Implement a nested function calling sequence in WebAssembly where `call_indirect` is used and followed by `br` and `br_if` instructions. Observe if the differential behavior causes the branch to target the wrong outer scope block.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func))
    (table funcref (elem))
    (func $inner (param i32)
      (call_indirect (type 0) (i32.const 0))
      (br 0)
    )
    (func $outer
      (block
        (call $inner (i32.const 1))
        (call_indirect (type 1) (i32.const 0))
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)