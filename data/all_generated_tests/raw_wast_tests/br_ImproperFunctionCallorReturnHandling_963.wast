;; 4. **Return from Function in an If Block:**    A function returns inside an `if` block which then uses a `br` to escape to an outer block. Test to ensure that the function return value is correctly captured and used after the `br` executes.

(assert_invalid
  (module
    (func $return-in-if-block (result i32)
      (block (result i32)
        (if (i32.const 1)
          (then
            (return (i32.const 42))
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)