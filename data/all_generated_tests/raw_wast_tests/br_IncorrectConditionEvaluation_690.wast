;; 1. **Test Description:**    A `loop` construct followed by a conditional `br_if` instruction where the condition is true when a counter is less than a specified value. Test should verify if `br_if` correctly exits the loop when the condition is met.    - **Constraint:** Ensures `br_if` evaluates conditions correctly within a loop structure.

(assert_invalid
  (module 
    (func $test_loop_br_if
      (local $counter i32)
      (loop $loop
        (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
        (br_if $loop (i32.lt_s (local.get $counter) (i32.const 5)))
      )
    )
  )
  "unknown label"
)