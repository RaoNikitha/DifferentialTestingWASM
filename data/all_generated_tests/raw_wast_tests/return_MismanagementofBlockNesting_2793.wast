;; 2. Implement a sequence of nested `if-else` conditions ending with a `return` inside the innermost `else` block. The test ensures that the `return` unwinds all nested blocks and loops properly. This targets whether the implementation can distinguish between exiting the innermost block and the function block.

(assert_invalid
  (module
    (func $nested-if-else-return (result i32)
      (local i32)
      (if (i32.const 1)
        (then (local.set 0 (i32.const 10)))
        (else (if (i32.const 0)
          (then (local.set 0 (i32.const 20)))
          (else (if (i32.const 0)
            (then (local.set 0 (i32.const 30)))
            (else (return)))
          ))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)