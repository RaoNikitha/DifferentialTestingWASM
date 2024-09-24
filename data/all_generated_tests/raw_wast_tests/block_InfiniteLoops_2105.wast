;; Test 6: Implement a conditional loop inside a block where the `br_if` should exit the loop on the second iteration. The block type indicates an `i32` result. Test if WebAssembly appropriately exits the loop based on runtime conditions, whereas `wizard_engine` incorrectly continues looping due to inappropriate `checkAndPopArgs`.

(assert_invalid
  (module (func $conditional-loop-br_if (result i32)
    (block $outer (result i32)
      (loop $inner 
        (i32.const 0)
        (i32.const 1)
        (i32.add)
        (br_if $outer (i32.const 1))
        (br $inner)
      )
    )
  ))
  "type mismatch"
)