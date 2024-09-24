;; 1. Test an `if` instruction with a nested `br_if` where the condition is checked against `0`. Verify that the `br_if` does not execute the branch since the condition is false. This test checks if false conditions correctly prevent the branch execution.

(assert_malformed
  (module
    (func $br_if_false_condition
      (if (i32.const 0)
        (then
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
)