;; 3. **Test 3: Function Call within a Loop Block**    - A loop inside a `block` calls a function that returns a value to the operand stack. The loop uses `br_if` to exit based on the function result.    - Verifies that stack values are correctly manipulated and function results interpreted to avoid infinite loops.

(assert_invalid
  (module
    (func $check (result i32) (i32.const 1))
    (func $test 
      (block (loop
        (call $check)
        (br_if 1 (i32.eqz (call $check)))
      ))
    )
  )
  "type mismatch"
)