;; 3. **Test Description 3: Misinterpreted If Statement Branch**    - Structure nested `if` statements inside a block. Use a `br_if 2` within the inner `if` branch and verify whether it properly targets the correct enclosing block.

(assert_invalid
  (module 
    (func 
      (block 
        (if (result i32) 
          (i32.const 1) 
          (then (br_if 2 (i32.const 0))))
      )
    )
  )
  "unknown label"
)