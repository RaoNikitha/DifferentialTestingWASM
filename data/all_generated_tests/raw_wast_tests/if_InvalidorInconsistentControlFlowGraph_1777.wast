;; 8. Develop an `if` instruction nested inside a function with oversized function parameters and local variables, checking if the CFG maintains correct label indexing and scope.

(assert_invalid
  (module
    (func $nested-if-test (param i32 i32 i32 i32 i32 i32 i32 local i32 i32 i32 i32 i32 i32 i32)
      (if (result i32)
        (i32.const 1)
        (then
          (if (i32.const 0) (then (i32.const 2)) (else (i32.const 3)))
          (i32.const 4)
        )
        (else
          (i32.const 5)
        )
      )
    )
  )
  "type mismatch"
)