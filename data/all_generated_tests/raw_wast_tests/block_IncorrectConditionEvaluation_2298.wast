;; Arrange a `block` that includes multiple stack-altering operations followed by `br_if` with nested `if-else` conditions. The stack's state should determine the branch's path, checking if the stack's height and content are maintained for accurate condition evaluation.

(assert_invalid
  (module (func $test
    (block (result i32)
      (i32.const 10)
      (i32.const 20)
      (i32.add)
      (br_if 1 (i32.const 1))
      (i32.const 30)
      (if (result i32)
        (then (i32.const 40))
        (else (i32.const 50))
      )
    )
  ))
  "type mismatch"
)