;; 9. Embed `nop` within a `loop` that conditionally calls another function with side-effects used to break the loop. Ensure `nop` does not disrupt this control flow, causing infinite looping.

(assert_invalid
  (module
    (func $break-loop
      (param i32)
      (result i32)
      (local.get 0)
    )
    (func $test
      (loop
        nop
        (br_if 1 (call $break-loop (i32.const 1)))
      )
    )
  )
  "loop must be parameterized"
)