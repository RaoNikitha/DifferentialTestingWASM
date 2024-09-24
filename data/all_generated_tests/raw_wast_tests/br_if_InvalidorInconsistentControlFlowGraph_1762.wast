;; 3. **Test Description**: Implement a sequence of nested `if` and `loop` blocks where the `br_if` conditionally exits based on nested block labels. Ensure that polyvariance in the stack state is preserved across the different branches.    - **Constraint Checked**: Correct handling of nested targets and preservation of stack polyvariance.    - **CFG Relation**: Tests whether the CFG appropriately manages complex, nested structure exits.

(assert_invalid
  (module
    (func $nested_if_loop
      (block
        (loop
          (i32.const 1)
          (if (i32.eqz (i32.const 0)) 
            (then (br_if 1))
          )
          (i32.const 0)
          (if (i32.eqz (i32.const 0)) 
            (then (br_if 0 (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)