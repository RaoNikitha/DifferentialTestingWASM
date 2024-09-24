;; - Test an `if` condition with a nested `br_if` instruction within the `then` block, which should branch out if the condition is true, validating if label and context handling differ in branching decisions.

(assert_invalid
  (module
    (func $test-if-br_if-nesting
      (block (result i32)
        (i32.const 0)
        (if (result i32)
          (then
            (i32.const 1)
            (br_if 0 (i32.const 1))
          )
          (else
            (i32.const 2)
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)