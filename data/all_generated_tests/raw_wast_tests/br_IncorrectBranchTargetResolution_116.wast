;; 7. Test a `br` targeting an outer `loop` from within multiple deeply nested `if` statements:    - **Constraint Checked**: Correct target resolution bypassing multiple `if` labels to reach `loop`.    - **Incorrect Branch Target**: Could mistakenly jump to an incorrect `if` rather than the intended `loop`.

(assert_invalid
  (module
    (func
      (loop
        (if (i32.const 1)
          (then
            (if (i32.const 1)
              (then
                (if (i32.const 1)
                  (then
                    (br 1)  ;; This should be invalid as it jumps to an incorrect label
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "invalid label"
)