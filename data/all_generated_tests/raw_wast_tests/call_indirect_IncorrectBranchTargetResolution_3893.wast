;; 2. **Test Description:**    Implement a `call_indirect` instruction where the target function includes nested blocks with branch instructions. Ensure the branch correctly exits the designated nested block. Comparison of the stack status before and after the branch will help identify incorrect branch target resolution.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $target_func (param i32)
      (block $outer
        (block $inner
          (br_if $inner (i32.const 1))
          (br $outer)
        )
      )
    )
    (table 1 funcref)
    (elem (i32.const 0) $target_func)
    (func $test_func
      (i32.const 0)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)