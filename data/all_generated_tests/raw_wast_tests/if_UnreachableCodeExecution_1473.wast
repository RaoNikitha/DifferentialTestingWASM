;; 4. Create an `if` block with mixed nesting levels and improper nesting error conditions. The incorrect nesting should lead to an `unreachable` instruction to see if error handling and branching manage control flow without reaching the `unreachable`.

(assert_invalid
  (module
    (func $mixed-nesting-error
      (if (result i32)
        (i32.const 0)
        (then
          (block (i32.const 1)
            (if (i32.const 1)
              (then
                (loop (br 1))
              )
            )
          )
        )
        (else
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)