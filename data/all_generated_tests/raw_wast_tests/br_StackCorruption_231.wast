;; 2. Create a deeply nested set of control structures with mixed `block` and `if` statements, then use `br` to target an outer `block` while maintaining various operand types on the stack. Check for mismanaged stack operations that could lead to stack corruption due to incorrect label indexing.

(assert_invalid
  (module
    (func $deeply_nested_block_and_if
      (block (result i32)
        (if (result i32)
          (block (result i32)
            (block (result i32)
              (if (result i32)
                (block (result i32)
                  (br 3)
                )
                (i32.const 1)
              )
              (i32.const 2)
            )
            (i32.const 3)
          )
          (i32.const 4)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)