;; 6. **Test Description 6:** Create a `br_if` that performs a signed integer comparison (e.g., `x < y` where x and y are negative numbers). Incorrect signed condition evaluations may lead to erroneous branching.    - **Constraint Checked:** Signed integer comparison accuracy.    - **Differential Behavior:** Wizard Engine may misinterpret signed values causing wrong branching conditions to be met.

(assert_invalid
  (module (func $signed-comparison
    (block (result i32)
      (block 
        (br_if 0 (i32.const -1) (i32.lt_s (i32.const -2) (i32.const -3)))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)