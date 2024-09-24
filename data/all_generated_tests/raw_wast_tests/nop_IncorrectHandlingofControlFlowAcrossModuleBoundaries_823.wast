;; 4. **Test 4: `nop` in Loop Within Imported Function**    - Embed a `nop` inside a loop in an imported function to check how it handles iterations.    - Validate that `nop` does not impact loop execution or the iteration control as the loop proceeds.

(assert_invalid
  (module
    (import "env" "func" (func $imported))
    (func (export "test")
      (loop
        (nop)
        ;; loop body
      )
    )
  )
  "unexpected instruction in loop"
)