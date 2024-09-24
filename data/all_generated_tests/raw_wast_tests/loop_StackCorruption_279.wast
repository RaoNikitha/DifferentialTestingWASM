;; 10. Implement a `loop` with a mix of `br` and `br_if` instructions to navigate several nested loops. Verify that each branch operation correctly manages the stack's state and no stack underflows or overflows occur.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (local i32)
      (loop (result i32) 
        (block (result i32)
          (loop (param i32) (result i32)
            (block (result i32)
              (i32.const 1)
              (local.set 1)
              (local.get 1)
              (br_if 0)
              (i32.const 0)
              (br 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)