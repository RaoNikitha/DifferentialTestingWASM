;; 8. **Conditional Br in Imported Function:**    Develop a test with an imported function that contains an `if` construct and a `br` inside the true block jumping to an outer label. This should test how `br` conditional branching manages control flow across module calls.

(assert_invalid
  (module
    (import "env" "foo" (func $foo))
    (func (result i32)
      (block (result i32)
        (call $foo) 
        (i32.const 1)
        (if (result i32)
          (i32.const 1)
          (then (br 1))
        )
      )
    )
  )
  "unknown label"
)