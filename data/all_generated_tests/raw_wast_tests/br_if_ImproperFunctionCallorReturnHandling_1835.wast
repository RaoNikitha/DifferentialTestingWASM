;; - A sequence of function calls where each function contains a `br_if` to a block followed by a return statement. This chain tests if improper handling of control transfers leads to incorrect function call/return behavior across multiple functions.

(assert_invalid
  (module
    (func $func1
      (block
        (br_if 0 (i32.const 1))
        (call $func2)
      )
      (return)
    )
    (func $func2 
      (block 
        (br_if 0 (i32.const 1))
        (return)
      )
    )
    (start $func1)
  )
  "unknown label"
)