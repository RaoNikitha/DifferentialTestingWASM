;; 9. **Test 9**: Implement a `block` that repeatedly calls a recursive function to check how the constructions handle function call stacks and return values, specifically focusing on proper context and stack management during deep recursion.

(assert_invalid
 (module 
  (func $recursive (result i32)
    (local i32)
    (local.set 0 (i32.const 1))
    (block (result i32)
      (loop (result i32)
        (call $recursive)
        (i32.add (local.get 0) (i32.const 1))
        (local.set 0)
        (br_if 0 (i32.eqz (local.get 0)))
      )
    )
  )
 )
 "type mismatch"
)