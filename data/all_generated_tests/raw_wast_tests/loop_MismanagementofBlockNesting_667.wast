;; - Test 8: A complex loop containing nested `loop` and `block` instructions with `br_table` branching targeting varying depths. Ensure all branch instructions correctly identify their respective targets based on unique conditions at various nested levels.

(assert_invalid
  (module (func $complex-nested-branching
    (result i32)
    (local i32)
    (loop (result i32)
      (i32.const 3)
      (loop (param i32) (result i32)
        (loop (result i32)
          (block (result i32)
            (br_table 0 1 2 (local.get 0))
            (i32.const 1) ;; Unreachable but ensures `br_table` branching
          )
          (i32.const 2) ;; Unreachable
        )
        (i32.const 4) ;; Unreachable
      )
      (i32.const 0) ;; Outer loop result
    )
  ))
  "type mismatch"
)