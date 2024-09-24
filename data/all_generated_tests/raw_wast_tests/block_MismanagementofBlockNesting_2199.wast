;; A test where a block contains nested `if` conditions and uses deep `br` instructions from within the if branches to exit the enclosing block. This ensures correct label indexing and block unwinding during conditional branches.

(assert_invalid
  (module
    (func $nested-br (result i32)
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (if (i32.const 1)
            (then (br 1 (i32.const 2)))
            (else (br 0 (i32.const 3)))
          )
        )
      )
    )
  )
  "type mismatch"
)