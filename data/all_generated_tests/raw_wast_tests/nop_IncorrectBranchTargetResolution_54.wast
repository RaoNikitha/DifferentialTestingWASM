;; Test 5: Place `nop` instructions around a `block` with multiple `br` instructions at different levels. Confirm that each `br` resolves to the appropriate block level and is not affected by the presence of `nop`.

 ;; (module
  (func $test (result i32)
    (block $outer
      (block $inner
        nop
        br $inner
        nop
        br $outer
        nop
      )
      nop
    )
    (i32.const 0)
  )
)