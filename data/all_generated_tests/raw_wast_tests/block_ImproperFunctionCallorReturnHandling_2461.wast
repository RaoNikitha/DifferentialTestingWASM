;; - Test 2: Generate a block that uses a `call_indirect` instruction to call a function through an indirect table. The called function should have a different return type than specified by the blocktype. This checks if the implementation can detect and handle type mismatches from indirect function calls correctly.

(assert_invalid
  (module
    (type $sig_void (func (result i32)))
    (type $sig_f32 (func (result f32)))
    (table 1 funcref)
    (elem (i32.const 0) $fn)
    (func $fn (type $sig_void) (i32.const 42))
    (func (block (result f32)
      (call_indirect (type $sig_void) (i32.const 0))
    ))
  )
  "type mismatch"
)