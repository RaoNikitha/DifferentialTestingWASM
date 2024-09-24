;; 5. **Test Description 5:** Use a `br_if` that should only branch if a floating-point comparison condition (`>=`) holds true. Incorrect floating-point evaluation must be tested as it could result in errors in real-world calculations.    - **Constraint Checked:** Floating-point condition evaluations.    - **Differential Behavior:** Wizard Engine may incorrectly decide to branch on wrong floating-point comparisons.

(assert_invalid
  (module
    (func $floating-point-comparison
      (block (result f32)
        (f32.const 1.5)
        (f32.const 1.0)
        (f32.ge)
        (br_if 0)
        (f32.const 2.0)
      )
    )
  )
  "type mismatch"
)