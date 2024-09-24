;; 9. Write a scenario where `call` instructions precede a `br` instruction within `if`-`else` chains nested in `loop`, targeting external `loop` with the intent to jumble function returns and improperly exit without actual returns being processed.

(assert_invalid
  (module
    (func $test 
      (loop $loop_outer
        (if (i32.const 1)
          (then
            (call 0)
            (br 1)
          )
          (else
            (call 0)
            (br 1)
          )
        )
      )
    )
    (func $func_0 (result i32)
      (i32.const 10)
    )
    (export "test" (func $test))
  )
  "type mismatch"
)