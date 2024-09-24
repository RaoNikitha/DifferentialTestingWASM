;; 3. **Test 3**: A loop with a `br_if` instruction that has insufficient items on the stack when the branch condition is evaluated, potentially leading to stack underflow. Checking if Wizard Engine correctly prevents stack underflow compared to WASM.

(assert_invalid
  (module
    (func $test-loop-br_if-stack-underflow
      (loop $L1
        (br_if $L1 (i32.const 1)) ; branch while loop condition is true
        (drop) ; insufficient items on stack for the jump
      )
    )
  )
  "stack underflow"
)