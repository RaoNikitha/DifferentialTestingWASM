;; 2. **Test Description**: A nested loop where the inner loop has a `br_if` conditional branch evaluated based on a complex arithmetic expression. The outer loop count is controlled by the inner loop's condition.    - **Constraint**: Checks if condition evaluation in `br_if` correctly handles nested loop scenarios.    - **Differential Behavior**: The outer loop iterates incorrectly due to a faulty condition evaluation in the inner loop's `br_if`.

(assert_invalid
  (module
    (func $nested_loop
      (loop (result i32)
        (i32.const 5)
        (loop (param i32) (result i32)
          (local.get 0)
          (i32.const 1)
          (i32.sub)
          (local.tee 0)
          (i32.const 0)
          (i32.eq)
          (br_if 1)
          (br 0)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)