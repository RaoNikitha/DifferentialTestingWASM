;; 8. **Test 8: External Function Call Impact on Loop**    - **Constraint:** Validate the impact of calling external (imported) functions within loops.    - **Description:** Design a loop that calls an external function whose result influences the loop's exit condition. Incorrect handling of the external function call can lead to an infinite loop.

(assert_invalid
  (module
    (import "env" "external" (func $external (result i32)))
    (func $loop (result i32)
      (local $i i32)
      (loop $continue
        (local.set $i (call $external))
        (local.get $i)
        (i32.eqz)
        (br_if $continue)
      )
    )
  )
  "type mismatch"
)