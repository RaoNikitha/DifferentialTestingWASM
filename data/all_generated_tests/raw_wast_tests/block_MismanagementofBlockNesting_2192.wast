;; A test where a deeply nested block has a `br_if` condition that should only exit the nearest enclosing block. This will ensure that the label stack is correctly managed, and only the intended block is exited.

(assert_invalid
  (module (func (result i32)
    (block $outer (result i32)
      (block $inner
        (br_if 1 (i32.const 1)) 
        (i32.const 42)
      )
      (i32.add (i32.const 0) (i32.const 1))
    )
  ))
  "type mismatch"
)