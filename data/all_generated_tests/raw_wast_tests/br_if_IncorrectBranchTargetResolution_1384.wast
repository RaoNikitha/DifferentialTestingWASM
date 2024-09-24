;; 5. Implement a `br_if` in a deeply nested combination of `block`, `loop`, and `if` instructions to test label resolution to an outermost block. This checks for proper stack prophecy handling and compares it with reachable and unreachable code paths.

(assert_invalid
  (module
    (func $deep-nested-br_if
      (block (result i32)
        (loop (result i32)
          (if (result i32)
            (block (result i32)
              (br_if 3 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)