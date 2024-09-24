;; Test 3: Implement a function that performs multiple `br_if` operations with changing conditions in nested `if` structures. The function should check for stack consistency by peeking stack values after each conditional branch.

(assert_invalid
  (module
    (func $nested-br_if-test (result i32)
      (block (result i32)
        (if (result i32)
          (i32.const 0)
          (then
            (block (result i32)
              (br_if 1 (i32.const 1)) ;; Try branching out of outer block
              (i32.const 42)
            )
          )
          (else
            (block (result i32)
              (br_if 1 (i32.const 0)) ;; Condition is false, should not branch
              (i32.add (br_if 0 (i32.const 1) (i32.const 1)) (i32.const 1))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)