;; 7. Invoke a `br_if` in a situation where it conditionally branches out of an `if` block that calls a function. Ensure the function return values are correctly maintained if the branch is taken, verifying how each implementation handles the stack after an `if` block.

(assert_invalid
  (module
    (func $conditional_br_if (result i32)
      (if (result i32)
        (i32.const 1)
        (block (result i32) (br_if 0 (call $some_function)) (i32.const 2))
      )
    )
    (func $some_function (result i32) (i32.const 42))
  )
  "type mismatch"
)