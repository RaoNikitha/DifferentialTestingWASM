;; 9. **Test Description:** Create a loop with complex branching conditions using `br_if` and multiple nesting levels. Verify that the loop exits under all conditions or runs indefinitely due to mismanagement of the operand stack or label lookup issues.

(assert_invalid
  (module
    (func (result i32)
      (local i32)
      (local.set 0 (i32.const 10))
      (block $outer
        (loop $inner
          (br_if $outer (i32.eqz (local.get 0)))
          (local.set 0 (i32.add (local.get 0) (i32.const -1)))
          (br_if $inner (i32.ne (local.get 0) (i32.const 5)))
          (i32.const 0)
        )
      )
    )
  )
  "invalid branch target"
)