;; 4. **Recursive Loop with Nested If**: Create a test where a nested `if` inside a `loop` has conditions that, if mishandled, could lead to re-entering the loop infinitely. Verify if the conditions are correctly evaluated.

(assert_invalid
  (module (func $recursive-loop-nested-if
    (loop (param i32) (result i32)
      (if (result i32)
        (i32.eq (local.get 0) (i32.const 0))
        (then (i32.const 42))
        (else (br 1 (call $recursive-loop-nested-if (i32.sub (local.get 0) (i32.const 1))))
        )
      )
    )
  ))
  "type mismatch"
)