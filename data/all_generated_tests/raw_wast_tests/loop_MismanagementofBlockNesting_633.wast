;; 4. **Deeply Nested Loops with Mixed Branch Instructions**:    Test nested loops with a mixture of `br`, `br_if`, and `br_table` instructions at various depths. This complex scenario verifies that all forms of branch instructions correctly handle the nested label indices, ensuring correct interpretation of nested loop structures, and proper flow of control.

(assert_invalid
  (module
    (func $nested-loops (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (loop (result i32)
          (local.set 0 (i32.const 0))
          (br_if 1 (local.get 0))
          (br 1)
        )
        (local.get 0)
      )
      (br_table 0 (local.get 0))
    )
  )
  "type mismatch"
)