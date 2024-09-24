;; 3. **Test: Nested `br_table` with Out-of-Bounds Index and Return**    - **Description**: A complex function with nested `br_table` instructions where the innermost `br_table` has an out-of-bounds index, followed by a `return`. This checks how nested branches and out-of-bounds are handled before returning.    - **Constraint**: Testing the combination of nested `br_table` indices and stack unwinding with `return`.

(assert_invalid
  (module
    (func $nested-br_table-with-return
      (block
        (block
          (block
            (br_table 0 1 2 (i32.const 3))
            (return)
          )
        )
      )
    )
  )
  "type mismatch"
)