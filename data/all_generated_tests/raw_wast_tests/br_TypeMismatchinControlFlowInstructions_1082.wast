;; 3. Create a scenario where an `if` block is meant to push an `i32` value, but a `br` instruction within an inner block of the `if` causes a jump with an incorrect `i64` value on the stack. This checks if the implementation correctly handles type consistency when branching out of an if structure.

(assert_invalid
  (module
    (func $type-mismatch-br
      (block
        (if (result i32)
          (i32.const 1)
          (then
            (block
              (i64.const 0)
              (br 1)
            )
          )
          (else
            (i32.const 1)
          )
        )
      )
    )
  )
  "type mismatch"
)