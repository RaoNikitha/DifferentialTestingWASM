;; 8. **Block with Recursive Function Calls**:    - Create a module where a `block` calls a function that in turn calls another function within the block's context. Verify the handling of recursive calls, ensuring both implementations maintain control flow and operand stacks correctly across module boundaries.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (func $f0 (result i32)
      (block (result i32)
        (call $f1)
        (i32.const 0)
      )
    )
    (func $f1 (result i32)
      (call $f2)
    )
    (func $f2 (result i32)
      (call $f0)
    )
  )
  "type mismatch"
)