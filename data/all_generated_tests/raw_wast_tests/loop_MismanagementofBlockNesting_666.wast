;; - Test 7: Implement a loop with multiple nested blocks, each containing its own loops and conditional branches, and use `br` and `br_if` instructions targeting various levels of the hierarchy. Confirm the correct campaign when exiting from different depths, ensuring comprehensive checking of nested context.

(assert_invalid
  (module
    (func (result i32)
      (block
        (loop (result i32)
          (block
            (loop (result i32)
              (br_if 1 (i32.const 0))
              (i32.const 10)
              (br 1)
            )
          )
          (i32.const 20)
          (br 1)
        )
      )
    )
  )
  "unreachable"
)