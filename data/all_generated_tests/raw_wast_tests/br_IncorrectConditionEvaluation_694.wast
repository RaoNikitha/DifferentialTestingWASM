;; 5. **Test Description:**    Multiple `loop` constructs where each `loop` has a `br_if` instruction with a condition that terminates the loop based on a counter value. Test should verify that loops terminate correctly when the condition is met.    - **Constraint:** Ensures correct evaluation of loop-exit conditions using `br_if`.

(assert_invalid
  (module
    (func $loop-test (result i32)
      (local $counter i32)
      (local.set $counter (i32.const 5))
      
      (loop $outer
        (loop $inner
          (local.set $counter (i32.sub (local.get $counter) (i32.const 1)))
          (br_if $inner (i32.gt_s (local.get $counter) (i32.const 0)))
        )
        (br_if $outer (i32.ne (local.get $counter) (i32.const 0)))
      )
      
      (local.get $counter)
    )
  )
  "stack height mismatch"
)