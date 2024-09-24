;; 4. **Test Description**: Implement nested loops where an inner loop has a `br_if` condition intended to exit it prematurely based on an external flag. Verify the flag's influence on the loop's behavior.    - **Constraint**: Validate the condition evaluation based on an external flag to correctly control the loop exit.    - **Incorrect Condition Evaluation**: This tests the nesting condition evaluation handling, checking misinterpretation of external flags.

(assert_invalid
  (module
    (func $nested-loop-with-br_if (param $flag i32) (result i32)
      (local $i i32)
      (i32.const 0)
      (set_local $i)
      (loop $outer (result i32)
        (loop $inner (result i32)
          (get_local $flag)
          (br_if $outer)
          (i32.const 1)
          (set_local $i)
          (br $inner)
        )
        (get_local $i)
      )
    )
  )
  "type mismatch"
)