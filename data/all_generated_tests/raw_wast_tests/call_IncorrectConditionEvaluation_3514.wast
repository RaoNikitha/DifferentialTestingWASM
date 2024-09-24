;; 3. Create a scenario where a function is called, and immediately after, a `br_if` condition evaluates whether a specific value should be popped from the stack. Mis-evaluation of the condition should result in incorrect stack operation.

(assert_invalid
  (module
    (func $type-condition-stack
      (call 1)
      (i32.const 1)
      (br_if 0 (i32.eq (i32.const 1) (i32.const 1)))
    )
    (func (param i32))
  )
  "type mismatch"
)