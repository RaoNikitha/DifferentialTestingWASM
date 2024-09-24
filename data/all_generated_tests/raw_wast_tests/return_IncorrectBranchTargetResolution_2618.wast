;; 7. Test Description: Implement a function with multiple nested loops, each containing complex control instructions like br_if and br_table. Place a return instruction in a nested loop and confirm that it exits the function correctly, which tests if the return instruction can accurately manage complex control flow.

(assert_invalid
  (module
    (func $nested-loops-complex-control (result i32)
      (local $a i32) (local $b i32) (local $c i32)
      (loop $outer1
        (loop $outer2
          (br_if $outer1 (i32.const 0))
          (br $outer2)
          (loop $inner1
            (br_table $outer1 $outer2 $inner1 (i32.const 1))
            (loop $inner2
              (br_if $inner1 (i32.const 0))
              (loop $inner3
                (br_if $inner2 (i32.const 0))
                (return)
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)