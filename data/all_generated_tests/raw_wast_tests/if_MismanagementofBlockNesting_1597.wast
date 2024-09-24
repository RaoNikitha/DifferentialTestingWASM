;; 8. **Multiple `if` Nested in `loop`**: Engineer an `if-else` structure nested in a `loop` with multiple branches at different depths, ensuring proper management of nested labels and control flow within a looping construct.

(assert_invalid
  (module (func $nested-if-loop (result i32)
    (loop (result i32)
      (if (result i32) (i32.const 1)
        (then
          (if (result i32) (i32.const 1)
            (then (br 0) (i32.const 1))
            (else (i32.const 1))
          )
        )
        (else
          (if (result i32) (i32.const 0)
            (then (i32.const 1))
            (else (br 0) (i32.const 0))
          )
        )
      )
    )
  ))
  "type mismatch"
)