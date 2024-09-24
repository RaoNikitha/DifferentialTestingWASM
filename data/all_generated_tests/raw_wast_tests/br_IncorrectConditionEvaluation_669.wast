;; 10. **Test Description**: Construct a scenario introducing side effects within condition evaluations for `br_if`. Confirm that side effects do not alter correct branching behavior due to incorrect condition evaluation.

(assert_invalid
  (module
    (func $side-effect-branch
      (local $x i32)
      (i32.store (i32.const 0) (i32.add (local.get $x) (i32.const 1)))
      (block (br_if 0 (i32.const 0) (local.set $x (i32.const 2))))
    )
  )
  "type mismatch"
)