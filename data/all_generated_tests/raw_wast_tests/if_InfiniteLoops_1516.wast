;; 7. **Nested `if` in a Loop with Mixed Conditions**: Create a test with nested `if` conditions inside a loop, with some conditions true and others false, combined with `br_if` and `br` instructions. Check if the loop correctly exits based on the mixed conditions.

(assert_invalid
  (module (func $nested-if-loop (param i32) (result i32)
    (loop (result i32)
      (if (result i32) (get_local 0)
        (then
          (if (result i32) (i32.const 0)
            (then (br 1 (i32.const 42)))
            (else (i32.const 1))
          )
        )
        (else
          (if (result i32) (i32.const 1)
            (then (br 0 (i32.const 24)))
            (else (i32.const 2))
          )
        )
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)