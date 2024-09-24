;; 3. **Test Description:**    Insert a `br_if` within an `if` block followed by an `else` block, where the condition evaluates expressions involving local variables. Ensure the `br_if` only branches when the condition evaluates to `true`.    - **Constraint Checked:** Correct handling of `br_if` conditions within `if`/`else` structure.    - **Relation to Incorrect Condition Evaluation:** Prevents branches where the condition should evaluate to `false`.

(assert_invalid
  (module
    (func $test_br_if_in_if_else
      (local $cond i32)
      (local.set $cond (i32.const 1))
      (if (i32.eq (local.get $cond) (i32.const 1))
        (then
          (block
            (br_if 0 (local.get $cond))
          )
        )
        (else
          (block
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)