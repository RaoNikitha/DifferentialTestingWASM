;; 2. Test a scenario where multiple `return` instructions are placed at different points within a function. Check if execution of these `return` instructions correctly unwinds the operand stack each time, ensuring consistency in stack handling and avoiding corruption when entering and exiting blocks.

(assert_invalid
  (module
    (func $multiple-returns-in-function (result i32)
      (i32.const 10)
      (return)
      (i32.const 20)
      (return)
    )
  )
  "type mismatch"
)