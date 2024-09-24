;; 3. Implement a nested `block` containing an `if-else` structure, which itself contains a loop. Use `br_if` instructions inside the loop to conditionally branch to multiple levels of nested blocks. Check if the branches correctly target the intended labels within the complex nesting.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (loop (result i32)
              (br_if 1 (i32.const 0))
              (i32.const 2)
            )
          )
          (else
            (i32.const 3)
          )
        )
      )
    )
  )
  "type mismatch"
)