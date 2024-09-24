;; 4. Design a function containing a loop that pushes values onto the stack in each iteration. Use `br_if` to check stack values and include a `return` when a specific value is found. Verify if the implementation unwinds to the correct stack state before returning.

(assert_invalid
  (module
    (func $loop-with-br_if-return (result i32)
      (local $i i32) (local $val i32)
      (loop $loop
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (local.set $val (i32.add (local.get $val) (i32.const 2)))
        (br_if $loop (i32.lt_s (local.get $i) (i32.const 5)))
        (return (local.get $val))
      )
    )
  )
  "type mismatch"
)