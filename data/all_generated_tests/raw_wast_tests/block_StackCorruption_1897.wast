;; 8. **Test Description**: Design a block where the stack height alternates extensively due to complex sequences of `call` instructions within nested blocks, ensuring that stack operations align with block type expectations and do not cause underflows or overflows.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (func $f0 (result i32) (i32.const 0))
    (func $type-stack-alternation (result i32)
      (block (result i32)
        (call $f0) (drop) (call $f0)  ; Stack alternates between 1 and 0
        (block (result i32)
          (call $f0)  ; Stack alternates again
          (br 0 (i32.const 1)))  ; Expects `i32`, provides `i32`
        (call $f0)  ; Continues stack alternation
        (i64.const 1))  ; Type mismatch - expects `i32`, provides `i64`
    )
  )
)