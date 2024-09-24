;; 4. **Test Function Call Series within Conditional if and else**:    Implement a sequence where multiple function calls occur inside `if` and `else` parts, verifying if the operand stack maintains consistency across both branches.

(assert_invalid
  (module
    (type $t (func (result i32) (param i32)))
    (func $f (result i32) (param i32) (i32.const 0))
    (func $test
      (if (result i32)
        (i32.const 1)
        (then 
          (call $f (i32.const 1))
          (call $f (i32.const 2))
        )
        (else
          (call $f (i32.const 3))
        )
      )
    )
  )
  "type mismatch"
)