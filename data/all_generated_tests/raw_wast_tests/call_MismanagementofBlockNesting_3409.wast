;; 8. **Sequential Nested Conditionals and Loops**: Develop a set of nested blocks and loops with several sequential `if` conditions, and `call` instructions inside the `then` or `else` blocks. Ensure the engine correctly manages and returns from function calls without disrupting the flow of subsequent control structures.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param) (result i32)))
    (func $deep-nested (param i32) (result i32)
      local.get 0
      if (result i32)
        i32.const 1
        call $inner1
      else
        i32.const 2
        call $inner2
      end
    )
    (func $inner1 (param) (result i32)
      loop (result i32)
        i32.const 3
        br 1
      end
    )
    (func $inner2 (param) (result i32)
      loop (result i32)
        i32.const 4
        br 1
      end
    )
    (func (call 5))
  )
  "unknown function"
)