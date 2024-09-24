;; 10. **Complex Control Flow**:     Create a sequence of blocks interleaved with `if-else` and loops where branch instructions toggle between entering and breaking multiple blocks. This checks the accuracy and correctness of control flow management across nested structures.

(assert_invalid
  (module
    (func $complex-control-flow (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_if 1 (i32.const 0))  ;; branch out from inner block
            (block (result i32)
              (if (result i32) (i32.const 1)
                (then (br 3)) ;; branch out of the loop
                (else (br 0 (i32.const 2))) ;; branch within the block
              )
            )
          )
          (block (result i32)
            (loop (result i32)
              (br_table 0 1 2 (i32.const 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)