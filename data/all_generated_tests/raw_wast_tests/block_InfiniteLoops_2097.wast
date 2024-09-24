;; Design a block containing a loop structure that uses both `br` and `br_if` instructions multiple times within the loop, targeting different blocks to ensure proper exit points to prevent infinite looping.

(assert_invalid
  (module
    (func $type-break-loop-structure (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_if 1 (i32.const 0))
            (block (result i32)
              (br_if 2 (i32.const 0))
              (br 1 (i32.const 0))
            )
          )
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)