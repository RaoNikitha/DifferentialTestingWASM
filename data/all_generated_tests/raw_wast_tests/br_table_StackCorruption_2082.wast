;; 2. **Test2: Misaligned Operand Types**    - **Description:** Create a situation where a `br_table` branches to labels expecting different operand types than what are present on the stack at the time of branching.    - **Stack Corruption Check:** Ensure that the stack's type constraints are violated, causing corruption or unexpected behavior.

(assert_invalid
  (module
    (func $misaligned-operand-types
      (block
        (i32.const 42)
        (f32.const 3.14)
        (br_table 0 0)
      )
    )
  )
  "type mismatch"
)