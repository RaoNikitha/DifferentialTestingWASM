;; - Test 7: Construct a test where erroneous operand consumption and re-pushing in `Wizard Engine` for a loop causes an infinite loop, while `WebAssembly` handles stack operations correctly.

(assert_invalid
  (module (func $loop-stack-infinite-loop
    (i32.const 1)
    (loop (param i32) (br 0))
  ))
  "infinite loop due to incorrect stack handling"
)