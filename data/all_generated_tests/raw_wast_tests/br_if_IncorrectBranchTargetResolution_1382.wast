;; 3. Implement a `br_if` instruction that conditionally jumps to an `if` block that includes further `block` and `loop` instructions inside. This ensures nested labels are resolved correctly and branch targets point to the correct `if` block.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (i32.const 0)
        (if (result i32)
          (block (result i32)
            (block (result i32)
              (loop (result i32)
                (br_if 0 (i32.const 1))
              )
            )
          (br_if 1 (i32.const 0))
          )
        (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)