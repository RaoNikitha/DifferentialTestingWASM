;; 2. **Test 2**: Create a loop with `br` to exit the loop properly but place `nop` instructions before `unreachable` to verify if the loop exits correctly and the unreachable code is only triggered when intended.

(assert_invalid
  (module
    (func $loop-unreachable
      (loop
        (br 1)
        (nop)
        (unreachable)
      )
    )
  )
  "unreachable code in loop"
)