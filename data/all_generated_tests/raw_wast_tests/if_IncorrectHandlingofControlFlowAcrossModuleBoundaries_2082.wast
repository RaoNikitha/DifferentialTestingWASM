;; 3. **Test Description:**    Test an `if` instruction within a loop that conditionally calls an exported function from another module. The test should verify that the loop's structure and operand stack maintain integrity both within the loop and upon returning from the function call, ensuring the control flow properly transitions across modules without inconsistencies.

(assert_invalid
  (module
    (func $otherFunc (export "otherFunc") (nop))
    (func (loop
      (if (i32.const 1)
        (then
          (call $otherFunc)
        )
      )
      (br 1)
    ))
  )
  "type mismatch"
)