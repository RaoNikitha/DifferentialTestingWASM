;; 5. **Mixed Nesting with Multiple Calls**:    - **Test Description**: Design a function with mixed nesting of loops and conditional blocks containing multiple call instructions. Each call modifies different elements on the stack and global context.    - **Constraint Checked**: Transfer of arguments and results through varied nested constructs.    - **Relation to Mismanagement of Block Nesting**: Ensures calls function correctly within highly mixed nested structures.

(assert_invalid
  (module
    (func $nested (param i32) (result i32)
      (local i32)
      (loop
        (if (i32.eq (local.get 0) (i32.const 1))
          (then
            (call $increase (i32.const 5))
            (local.set 1 (i32.add (local.get 0) (i32.const 2)))
          )
        )
        (if (i32.eq (local.get 0) (i32.const 2))
          (then
            (call $decrease (i32.const 3))
            (local.set 1 (i32.sub (local.get 0) (i32.const 1)))
          )
        )
      )
    )
    (func $increase (param i32))
    (func $decrease (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 3))
    )
    (table funcref (elem $nested $increase $decrease))
  )
  "type mismatch"
)