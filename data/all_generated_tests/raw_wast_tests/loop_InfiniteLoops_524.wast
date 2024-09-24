;; - Test 5: Design a loop where the stack unwinding fails in `Wizard Engine` on `br` to loop's start, causing continuous re-execution and differing from `WebAssembly`'s expected behavior.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (loop (result i32)
        (br 0)
        (nop)
      )
      (drop)
    )
  )
  "type mismatch"
)