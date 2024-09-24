;; 3. **Test Operand Stack Mismatch**:    - Design a `loop` that pushes and pops a mismatched number of operands before and after a backwards branch using `br`.    - **Constraint**: Correct operand stack management.    - **CFG Impact**: Incorrect handling of the operand stack can result in CFG paths that expect operands that are not present, or vice versa.

(assert_invalid
  (module
    (func $operand_stack_mismatch
      (loop (result i32)
        (i32.const 1)
        (br 0)  ;; branch backward to loop
        (i32.const 2)  ;; inconsistent stack height
      )
    )
  )
  "type mismatch"
)