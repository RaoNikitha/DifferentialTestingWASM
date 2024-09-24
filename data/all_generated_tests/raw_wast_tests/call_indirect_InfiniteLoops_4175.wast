;; 4. **Test Description**: Create a test with a loop conditionally calling `call_indirect` based on a counter variable reduced after each iteration. The loop should exit when the counter reaches zero, but improper stack handling causes the counter not to decrement correctly.    - **Constraint Being Checked**: Correct update and use of local variables and stack consistent operations.    - **Relation to Infinite Loops**: If the counter fails to decrement because of operand handling issues, the loop will not exit, causing an infinite loop.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $callee)
    (func $callee (result i32)
      (local.get 0)
    )
    (func $test (result i32)
      (local $counter i32)
      (local.set $counter (i32.const 5))
      (block $exit
        (loop $loop
          (br_if $exit (i32.eqz (local.get $counter)))
          (call_indirect (type $sig) (i32.const 0) (local.get $counter))
          (local.set $counter (i32.sub (local.get $counter) (i32.const 1)))
          (br $loop)
        )
      )
      (local.get $counter)
    )
  )
  "type mismatch"
)