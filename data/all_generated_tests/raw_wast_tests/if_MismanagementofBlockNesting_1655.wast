;; 6. Implement a WebAssembly module where several `if` blocks are nested within each other without any `else` branches until the deepest level, where multiple `else` branches are defined. Use `br_if` and `br` instructions to break and conditionally jump within these structures to verify proper block management.

(assert_invalid
  (module
    (func $nested_if_conditions
      (if (i32.const 1)
        (then
          (if (i32.const 0)
            (then
              (if (i32.const 1)
                (then
                  (br_if 0 (i32.const 1))
                )
                (else (i32.const 4))
                (else (i32.const 3))
              )
            )
          )
        )
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)