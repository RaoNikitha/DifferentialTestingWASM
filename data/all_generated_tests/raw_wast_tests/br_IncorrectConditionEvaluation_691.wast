;; 2. **Test Description:**    A deeply nested sequence of `block` and `if` control structures with a `br_if` at each level, where conditions are based on a stack of boolean values. Test should check if `br_if` jumps to correct labels based on condition evaluation at each nesting level.    - **Constraint:** Verifies correct relative label lookup and condition evaluation in nested structures.

(assert_invalid
  (module
    (func $deeply-nested-branches
      (i32.const 0)
      (block
        (br_if 0 (i32.const 1))
        (block
          (br_if 1 (i32.const 1))
          (block
            (br_if 2 (i32.const 1))
            (block
              (br_if 3 (i32.const 1))
              (i32.const 0)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)