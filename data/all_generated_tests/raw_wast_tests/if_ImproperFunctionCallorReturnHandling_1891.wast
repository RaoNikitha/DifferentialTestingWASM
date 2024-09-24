;; 2. **Test Call Indirect Lookup in Conditional Flow**:    Inside a conditional `if` block, use `call_indirect` to invoke a function index based on a dynamic type check with function tables. Verify that incorrect type matching causes misdirection in function calls when the condition is true.

(assert_invalid
  (module (func $call_indirect_in_if_block
    (block
      (i32.const 1)
      (if (result i32)
        (i32.const 0)
        (then
          (call_indirect (type 0) (i32.const 0) (i32.const 1))
        ) 
        (else
          (i32.const 0)
        )
      )
    )
  ))
  "type mismatch"
)