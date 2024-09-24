;; 3. **Test 3: Conditional Branch to Invalid Target**    - Description: Inside a loop, insert a `br_if` branch instruction with a condition that randomly generates a label index out of range. The test should confirm the handling of invalid branch targets.    - Constraint: Tests the robustness of label index validation and error handling.

(assert_invalid
  (module
    (func $invalid-loop-br_if
      (i32.const 1)
      (loop (result i32)
        (br_if 1 (i32.const 1))
        (i32.const 0)
      )
    )
  )
  "invalid branch target"
)