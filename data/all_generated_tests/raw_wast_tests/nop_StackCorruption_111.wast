;; 2. Place a sequence of `nop` instructions within a loop construct, intersperse it with operations that push and pop values from the stack within the loop, and validate that the stack maintains its expected state after loop execution.

(assert_invalid
  (module
    (func $test-loop
      (loop $loop 
        nop
        nop
        i32.const 1
        drop
        br $loop
      )
    )
  )
  "type mismatch"
)