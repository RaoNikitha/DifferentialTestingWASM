;; - **Test Description 3**: An `if` instruction that should evaluate true (e.g., `i32.const 1`) but then use a `br_if` to conditionally take a branch within the `then` block. Check if the `br_if` condition is correctly evaluated and skips the `else` block purely based on the initial condition.

(assert_invalid
  (module 
    (func $test (result i32)
      (if (result i32) (i32.const 1)
        (then
          (i32.const 1)
          (br_if 0 (i32.const 0))
          (i32.const 2)
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)