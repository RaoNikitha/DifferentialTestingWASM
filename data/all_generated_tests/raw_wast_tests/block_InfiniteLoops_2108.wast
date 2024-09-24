;; Test 9: Create a block that includes a loop controlled by a global counter where `br_if` conditions should eventually terminate. The block type expects an `i32` outcome. Test if WebAssembly correctly exits the loop when the counter is exhausted, compared to `wizard_engine` which may misjudge the operand stack state and loop infinitely.

(assert_invalid
  (module (global $counter (mut i32) (i32.const 5))
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (global.get $counter)
          (i32.const 1)
          (i32.sub)
          (global.set $counter)
          (br_if 1 (global.get $counter))
          (i32.const 0)
        )
        (i32.const 10)
      )
    )
  )
  "type mismatch"
)