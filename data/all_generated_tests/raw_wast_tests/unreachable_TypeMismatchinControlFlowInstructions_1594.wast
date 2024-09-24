;; 5. Write a function that utilizes `br_if` to conditionally break to a `block` which contains `unreachable`. Check if breaking respects stack type consistency despite the `unreachable` trappings the block exit.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (br_if 0 (i32.const 1))
        unreachable
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)