;; 4. **Branch Based on Arithmetic Comparison**    - Construct a loop performing arithmetic operations, placing a comparison result (e.g., greater than) on the stack, followed by a `br_if` that should only execute if the result is true.    - **Reason**: Checks the accurate evaluation of arithmetic-based conditions for `br_if` in loops.

(assert_invalid
  (module
    (func $arithmetic-comparison-br_if
      (param i32)
      (loop (result i32)
        (get_local 0)
        (i32.const 10)
        (i32.gt_s)
        (br_if 0)
        (get_local 0)
      )
    )
  )
  "type mismatch"
)