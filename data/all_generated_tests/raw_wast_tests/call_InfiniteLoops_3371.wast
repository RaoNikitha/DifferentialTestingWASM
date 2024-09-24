;; Test 10: Create a loop that uses a function call to push multiple results onto the stack, affecting subsequent "br" and "br_if" instructions within the loop. Validate if the function correctly manages stack operations and types, ensuring that the loop control flow exits correctly without entering an infinite loop.

(assert_invalid
  (module
    (func $push_results (result i32 i32)
      i32.const 42
      i32.const 84
    )
    (func (result i32)
      i32.const 0
      loop (result i32)
        call $push_results
        drop
        drop
        br_if 1
        call $push_results
        i32.const 0
        br_if 0
      end
    )
  )
  "type mismatch"
)