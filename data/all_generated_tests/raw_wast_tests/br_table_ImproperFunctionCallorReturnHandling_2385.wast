;; 5. Design a test where `br_table` targets contain mixed `call` and `return` instructions separated by other operations. Verify if the correct function calls and returns are consistently respected across all branches.

(assert_invalid
  (module
    (func $mixed-calls-returns (param i32) (result i32)
      (block (i32.const 1)
        ;; Operand 0, expected to invoke func1 then return 10
        (block (br_table 0 1
          (i32.call 0)
          (i32.const 2)
          (return (i32.const 10))))
        ;; Operand 1, should return 10 without invoking func1
        (i32.const 1)
        (i32.call 1)
        (return (i32.const 10))
      ))
    (func (drop))
    (func (result i32)
      (i32.const 1)
      (return)
    )
  )
  "type mismatch"
)