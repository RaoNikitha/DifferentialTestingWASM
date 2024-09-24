;; 3. **Test Description: Embed `nop` between multiple `br_if` instructions within a loop.**    - **Reasoning**: Test that `nop` does not influence conditional branching.    - **Check**: The loop should terminate correctly based on the `br_if` conditions.

 ;; (module
  (func $test-loop
    (loop $loop
      i32.const 1
      br_if $loop
      nop
      i32.const 0
      br_if $loop
    )
  )
)
(assert_invalid
  (module (func $type-i32 (result i32) 
    (loop $loop
      i32.const 1
      br_if $loop
      nop
      i32.const 0
      br_if $loop
      (return)
    )))
  "type mismatch"
)