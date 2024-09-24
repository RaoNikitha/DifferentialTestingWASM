;; - Test 10: Design a loop that operates with a large stack depth filled with values and types expecting specific stack patterns on each iteration. Overuse backward jumps (`br`) with this complex stack to test if the stack height and values get corrupted over many iterations.

(assert_invalid
  (module (func $complex_loop
    (loop (result i32)
      (i32.const 0)
      (i32.const 1)
      (i32.const 2)
      (i32.const 3)
      (i32.const 4)
      (i32.const 5)
      (i32.const 6)
      (i32.const 7)
      (i32.const 8)
      (i32.const 9)
      (i32.const 10)
      (i32.const 11)
      (i32.const 12)
      (i32.const 13)
      (i32.const 14)
      (i32.const 15)
      (i32.const 16)
      (i32.const 17)
      (i32.const 18)
      (i32.const 19)
      br 0
      drop
    )
  ))
  "stack height and value mismatch"
)