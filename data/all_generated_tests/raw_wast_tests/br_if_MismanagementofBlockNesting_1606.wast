;; 7. **Test 7**: Implement a case with a nested `block`, `loop`, and `if` where `br_if` targets the outermost block upon a true condition. Confirm the control flow exits all nested structures correctly, verifying label resolution at multiple nesting levels.

(assert_invalid
  (module
    (func $nested-block-loop-if
      (block 
        (loop 
          (if (i32.const 1) 
            (then (br_if 1 (i32.const 1)))
          )
          (br 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)