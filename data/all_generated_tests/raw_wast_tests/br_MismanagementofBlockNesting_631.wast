;; 2. Construct an `if` block within a `loop`, followed by an inner `block`. The inner block contains `br 1`. This tests if `br 1` properly breaks out of the `if` but still within the scope of the `loop`. This tests the correct unwinding of the operand stack.

(assert_invalid
  (module
    (func $loop-if-block
      (loop (if (i32.const 1) (block (br 1)))) 
    )
  )
  "unknown label"
)