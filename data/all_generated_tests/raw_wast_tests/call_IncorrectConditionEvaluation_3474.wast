;; Test 3: Implement a function that makes a recursive call to itself using `call`, and include a `br_if` within the function to exit based on the value of a decrementing counter.

(assert_invalid
  (module
    (func $recursive_call (param i32) (result i32)
      (local.get 0)
      (i32.const 0)
      (i32.eq)
      (br_if 0)
      (local.get 0)
      (i32.const 1)
      (i32.sub)
      (call $recursive_call)
    )
  )
  "unknown function"
)