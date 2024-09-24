;; 9. Develop a test using multiple `nop` instructions within a function that performs stack manipulation with `drop` and `select` instructions. Check that the stack remains in a valid state without being affected by the presence of `nop`.

(assert_invalid
  (module
    (func $test
      (i32.const 5)
      nop
      nop
      nop
      (drop)
      nop
      (i32.const 10)
      (i32.const 20)
      nop
      (select)
      nop
    )
  )
  "type mismatch"
)