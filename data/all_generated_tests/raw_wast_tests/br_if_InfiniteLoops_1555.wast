;; Design a test with a loop where br_if should fail to exit due to a zero condition on stack, verifying that the loop continues execution correctly without infinite looping.

(assert_invalid
  (module
    (func $loop-with-br_if
      (loop
        (br_if 0 (i32.const 0))
        (i32.const 0) (i32.eqz) (drop)
      )
    )
  )
  "type mismatch"
)