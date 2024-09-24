;; 8. Construct a scenario with a `loop` inside a nested `if-else` that contains multiple inner loops. Use `br_table` to branch to various cases within inner loops, checking if the function context correctly handles operand stack unwind and target label resolution properly.

(assert_invalid
  (module
    (func $nested-loop-if
      (block
        (i32.const 1)
        (if (result i32)
          (then (loop $L1 (result i32)
            (i32.const 2)
            (i32.const 3)
            (br_table $L1 1 0)
          ))
          (else (loop $L2 (result i32)
            (i32.const 4)
            (br_table $L2 1 0)
          ))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)