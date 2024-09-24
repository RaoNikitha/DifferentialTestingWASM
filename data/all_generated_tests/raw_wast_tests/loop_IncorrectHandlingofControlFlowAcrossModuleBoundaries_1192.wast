;; Test 3: Two modules where the first module calls an imported function containing a loop that includes a conditional branch. Test if the condition is correctly evaluated without breaking the control flow, focusing on the handling of the control stack as it transitions between modules.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func $testFunc
      (call $externalFunc)
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.eqz (i32.const 0)))
      )
      (drop)
    )
  )
  "type mismatch"
)