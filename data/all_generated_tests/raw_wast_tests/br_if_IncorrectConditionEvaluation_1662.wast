;; 3. Test a `br_if` instruction targeting an `if` block with the condition evaluating to true, checking for improper condition evaluation that might inadvertently skip the `if` block's execution.

(assert_invalid
  (module
    (func $cond-if-true (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (br_if 0 (i32.const 1))
          (i32.const 2)
        )
      )
    )
  )
  "invalid type"
)